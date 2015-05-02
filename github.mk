GH_RELEASES_MAIN = $(addprefix github/, $(addsuffix .json, $(MAIN_VERSIONS)))
GH_RELEASES_WORK = $(addprefix github/, $(addsuffix .json, $(WORK_VERSIONS)))

releases: $(addprefix .markers/gh-, $(MAIN_VERSIONS) $(WORK_VERSIONS))

.markers/gh-%: github/%.json | lua-%.tar.gz .curl .markers/
	# curl -K .curl --data @$< https://api.github.com/repos/lua/lua/releases
	# TODO: Parse the "upload_url" field from the JSON response and use
	#       it to upload the original release tarball as an "asset"
	touch $@

$(GH_RELEASES_MAIN): github/%.json: release.json | github/
	sed 's/$$TAGNAME/$*/g; s/$$PRERELEASE/false/g' $< > $@

$(GH_RELEASES_WORK): github/%.json: release.json | github/
	sed 's/$$TAGNAME/$*/g; s/$$PRERELEASE/true/g' $< > $@

github/ .markers/:
	mkdir -p $@

.curl:
	@echo 'Error: Require auth token in $@ file'
	@exit 1

json: $(GH_RELEASES_MAIN) $(GH_RELEASES_WORK)


.PHONY: releases json

