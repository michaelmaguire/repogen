include check.mk
include graph.mk
include github.mk

GET         = curl -s -L -o $@
ASSERT_HEAD = test `git rev-parse $(1)^{}` = `git rev-parse HEAD`
TAR_GZ_MAIN = $(addprefix tarballs/lua-, $(addsuffix .tar.gz, $(MAIN_VERSIONS)))
TAR_GZ_WORK = $(addprefix tarballs/lua-, $(addsuffix .tar.gz, $(WORK_VERSIONS)))

export GIT_COMMITTER_NAME = repogen
export GIT_COMMITTER_EMAIL =
export GIT_AUTHOR_NAME = Lua Team
export GIT_AUTHOR_EMAIL = team@lua.org

all: $(TAGS)/5.3.1 $(TAGS)/5.2.4 $(TAGS)/5.1.5 $(TAGS)/5.0.3
	git -C $(REPO) checkout master

$(TAGS)/%: lua-%/
	@if test -z '$(RELEASE_DATE)'; then \
	  echo 'Error: No RELEASE_DATE set for $*' >&2; \
	  exit 1; \
	fi
	@if test '$*' != 1.0; then \
	  cd $(REPO) && $(call ASSERT_HEAD, $(notdir $(word 2, $^))); \
	fi
	rm -rf $(REPO)/*
	cp -rf lua-$*/* $(REPO)
	git -C $(REPO) add .
	git -C $(REPO) commit -m 'Lua $*'
	git -C $(REPO) tag -m 'Lua $*' $*
	if test -n '$(EXTRA_TAG)'; then \
	  git -C $(REPO) tag -m 'Lua $(EXTRA_TAG)' $(EXTRA_TAG); \
	fi
	cd $(REPO) && $(call ASSERT_HEAD, $*)

$(BRANCHES)/%:
	git -C $(REPO) branch $* $(<F)
	git -C $(REPO) checkout $*

lua-%/: tarballs/lua-%.tar.gz
	$(RM) -r $@ TMP
	mkdir TMP
	cp $< TMP
	cd TMP && tar xzf $(<F)
	mv TMP/$(or $(TARDIR),$@) $@
	$(RM) -r TMP
	touch $@

$(TAR_GZ_MAIN): tarballs/lua-%.tar.gz: | tarballs/
	$(GET) http://www.lua.org/ftp/$(@F)

$(TAR_GZ_WORK): tarballs/lua-%.tar.gz: | tarballs/
	$(GET) http://www.lua.org/work/old/$(@F)

$(REPO)/:
	git init $@
	git -C $@ remote add github git@github.com:lua/lua.git

tarballs/:
	mkdir -p $@

fetch: | $(TAR_GZ_MAIN) $(TAR_GZ_WORK)

check: sha1sums.txt | $(TAR_GZ_MAIN) $(TAR_GZ_WORK)
	sha1sum -c $<

clean:
	$(RM) -r $(REPO) lua-*/ TMP/
	$(RM) releases/*-*.json releases/*.*.[1-9].json

clean-all: clean
	$(RM) -r tarballs/


.DEFAULT_GOAL = all
.PHONY: all fetch check clean clean-all
.SECONDARY:
.NOTPARALLEL:
