include graph.mk

GET         = curl -s -L -o $@
DIRIFY      = $(addprefix lua-, $(addsuffix /, $(1)))
TARIFY      = $(addprefix lua-, $(addsuffix .tar.gz, $(1)))
TARBALLS    = $(call TARIFY, $(MAIN_VERSIONS))
XTARBALLS   = $(call TARIFY, $(WORK_VERSIONS))
UNTAR_LUA   = $(call DIRIFY, 1.1 2.1 2.2 2.4 2.5 3.0 3.1 3.2 3.2.1 3.2.2 4.0)
UNTAR_LUA51 = $(call DIRIFY, 5.1-rc1 5.1-rc2 5.1-rc3 5.1-rc4)

# Commit date is fixed so that commit IDs stay the same
export GIT_COMMITTER_DATE = 2015-04-12T00:00Z
export GIT_COMMITTER_NAME = repogen
export GIT_COMMITTER_EMAIL =
export GIT_AUTHOR_NAME = Lua Team
export GIT_AUTHOR_EMAIL = team@lua.org

all: $(TAGS)/5.3.0

$(TAGS)/%: lua-%/ | $(REPO)/
	rm -rf $(REPO)/*
	cp -rf lua-$*/* $(REPO)
	cd $(REPO) && git add .
	git --git-dir=$(REPO)/.git commit -m 'Lua $*'
	git --git-dir=$(REPO)/.git tag $*

$(UNTAR_LUA): lua-%/: lua-%.tar.gz
	test ! -e $@
	tar xzf $<
	mv lua $@
	touch $@

$(UNTAR_LUA51): lua-%/: lua-%.tar.gz
	test ! -e $@
	mkdir TMP
	cp $< TMP
	cd TMP && tar xzf $<
	mv TMP/lua-5.1 $@
	$(RM) -r TMP
	touch $@

lua-%/: lua-%.tar.gz
	test ! -e $@
	tar xzf $<
	touch $@

$(TARBALLS): lua-%.tar.gz:
	$(GET) http://www.lua.org/ftp/$@

$(XTARBALLS): lua-%.tar.gz:
	$(GET) http://www.lua.org/work/old/$@

$(REPO)/:
	git init $@
	cd $@ && git remote add github git@github.com:lua/lua.git

fetch: | $(TARBALLS) $(XTARBALLS)

# Fetching lua-5.2.0-alpha-rc3.tar.gz currently returns "403 Forbidden"
check: sha1sums.txt | $(TARBALLS) $(filter-out lua-5.2.0-alpha-rc3.tar.gz, $(XTARBALLS))
	sha1sum -c $<

clean:
	$(RM) -r $(REPO) lua-*/

clean-all: clean
	$(RM) lua-*.tar.gz


.PHONY: all fetch check clean clean-all
.SECONDARY:
.NOTPARALLEL:
