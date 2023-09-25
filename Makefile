# Enable environment variables for dev
ifneq (,$(wildcard ./.env))
    include .env
    export
endif

ENVSUBST := /usr/bin/env envsubst
BUTANE := /usr/bin/env butane

TEMPLATE := $(PWD)/ignitions/main.yml

.PHONY: all
all: dist/ignition.json

dist/ignition.json: dist/butane.yml
	@$(BUTANE) --pretty --strict $< > $@

dist/butane.yml: $(TEMPLATE) dist
	@$(ENVSUBST) < $< > $@

dist:
	@mkdir -p $@

.PHONY: clean
clean:
	@rm -r dist

.PHONY: serve
serve: dist/ignition.json
	@python3 -m http.server -d dist
