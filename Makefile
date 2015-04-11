include graph.mk

GET = curl -s -L -o $@

VERSIONS = 1.0 1.1 2.1 2.2 2.4 2.5 3.0 3.1 3.2 3.2.1 3.2.2 4.0 4.0.1 \
           5.0 5.0.1 5.0.2 5.0.3 5.1 5.1.1 5.1.2 5.1.3 5.1.4 5.1.5 \
           5.2.0 5.2.1 5.2.2 5.2.3 5.2.4 5.3.0

TARBALLS = $(addprefix lua-, $(addsuffix .tar.gz, $(VERSIONS)))

all: repo/.git/refs/tags/5.3.0

repo/.git/refs/tags/%: lua-%/ | repo/
	rm -rf repo/*
	cp -rf lua-$*/* repo
	cd repo && git add .
	git --git-dir=repo/.git commit -m 'Lua $*'
	git --git-dir=repo/.git tag $*

$(MOVEDIRS): lua-%/: lua-%.tar.gz
	tar xzf $<
	mv lua $@
	touch $@

lua-%/: lua-%.tar.gz
	tar xzf $<
	touch $@

lua-%.tar.gz:
	@$(GET) http://www.lua.org/ftp/$@
	@echo 'Fetched $@'

repo/:
	git init $@
	cd $@ && git config user.name 'Lua Team'
	cd $@ && git config user.email 'team at lua.org'

fetch: | $(TARBALLS)

check: sha1sums.txt | $(TARBALLS)
	sha1sum -c $<

clean:
	$(RM) -r repo lua-*/


.PHONY: all fetch check clean
.SECONDARY:
.NOTPARALLEL:
