GET      = curl -s -L -o $@
REPO     = repo
TAGS     = $(REPO)/.git/refs/tags
TARBALLS = $(addprefix lua-, $(addsuffix .tar.gz, $(VERSIONS)))

VERSIONS = 1.0 1.1 2.1 2.2 2.4 2.5 3.0 3.1 3.2 3.2.1 3.2.2 4.0 4.0.1 \
           5.0 5.0.1 5.0.2 5.0.3 5.1 5.1.1 5.1.2 5.1.3 5.1.4 5.1.5 \
           5.2.0 5.2.1 5.2.2 5.2.3 5.2.4 5.3.0

MOVEDIRS = $(addprefix lua-, $(addsuffix /, \
           1.1 2.1 2.2 2.4 2.5 3.0 3.1 3.2 3.2.1 3.2.2 4.0))

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

$(MOVEDIRS): lua-%/: lua-%.tar.gz
	tar xzf $<
	mv lua $@
	touch $@

lua-%/: lua-%.tar.gz
	tar xzf $<
	touch $@

lua-%.tar.gz:
	$(GET) http://www.lua.org/ftp/$@

$(REPO)/:
	git init $@
	cd $@ && git remote add github git@github.com:lua/lua.git

fetch: | $(TARBALLS)

check: sha1sums.txt | $(TARBALLS)
	sha1sum -c $<

clean:
	$(RM) -r $(REPO) lua-*/

clean-all: clean
	$(RM) lua-*.tar.gz


include graph.mk
.PHONY: all fetch check clean clean-all
.SECONDARY:
.NOTPARALLEL:
