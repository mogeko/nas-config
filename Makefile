# Enable environment variables for dev
ifneq (,$(wildcard ./.env))
    include .env
    export
endif

ENVSUBST := /usr/bin/env envsubst
BUTANE := /usr/bin/env butane

TEMPLATE := $(PWD)/.github/config.template

.PHONY: all fcc ign

all: nas.ign

fcc: $(TEMPLATE)
	@$(ENVSUBST) < $(TEMPLATE)

%.fcc: clean
	@$(MAKE) -s fcc > $@

ign:
	@$(MAKE) -s fcc | $(BUTANE) --pretty --strict

%.ign: clean
	@$(MAKE) -s ign > $@

clean:
	@rm -f *.ign *.fcc
