BUTANE := /usr/bin/env butane
YQ     := /usr/bin/env yq

.PHONY: all
all: clean dist/ignition.json

dist/ignition.json: dist/butane.yml
	@$(BUTANE) --pretty --strict $< > $@

dist/butane.yml: $(wildcard ignitions/*.yml) | dist
	@$(YQ) eval-all '. as $$i ireduce ({}; . *+ $$i)' $^ > $@

dist:
	@mkdir -p $@

.PHONY: clean
clean:
	@rm -rf ./dist

.PHONY: serve
serve: dist/ignition.json
	@python3 -m http.server -d dist
