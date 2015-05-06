MAIN_PREDEFINED = 1.0 1.1 2.1 2.2 2.4 2.5 3.0 3.1 3.2 4.0 5.0 5.1 5.2.0 5.3.0
MAIN_GENERATED  = $(filter-out $(MAIN_PREDEFINED), $(MAIN_VERSIONS))
RELEASES_MAIN   = $(addprefix releases/, $(addsuffix .json, $(MAIN_GENERATED)))
RELEASES_WORK   = $(addprefix releases/, $(addsuffix .json, $(WORK_VERSIONS)))
GITHUB_API      = https://api.github.com

releases: $(addprefix .markers/gh-, $(MAIN_VERSIONS) $(WORK_VERSIONS))

.markers/gh-%: releases/%.json | tarballs/lua-%.tar.gz .curl .markers/
	curl -K .curl --data @$< -o $@ $(GITHUB_API)/repos/lua/lua/releases

$(RELEASES_MAIN): releases/%.json: template.json.in
	sed 's/$$TAGNAME/$*/g; s/$$PRERELEASE/false/g' $< > $@

$(RELEASES_WORK): releases/%.json: template.json.in
	sed 's/$$TAGNAME/$*/g; s/$$PRERELEASE/true/g' $< > $@

.markers/:
	mkdir -p $@

.curl:
	@echo 'Error: Require auth token in $@ file'
	@exit 1

json: $(RELEASES_MAIN) $(RELEASES_WORK)


.PHONY: releases json
