include graph.mk

GET = curl -L -o $@

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
	$(GET) http://www.lua.org/ftp/$@

repo/:
	git init $@
	cd $@ && git config user.name 'Lua Team'
	cd $@ && git config user.email 'team at lua.org'

clean:
	$(RM) -r repo lua-*/


.PHONY: all clean
.SECONDARY:
.NOTPARALLEL:
