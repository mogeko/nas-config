ENVSUBST := /usr/bin/env envsubst
BUTANE := /usr/bin/env butane

TEMPLATE := $(PWD)/.github/config.template

.PHONY: all fcc ign

all: nas.ign

fcc: $(TEMPLATE)
	@$(ENVSUBST) < $(TEMPLATE)

%.fcc:
	@$(MAKE) -s fcc > $@

ign:
	@$(MAKE) -s fcc | $(BUTANE) --pretty --strict

%.ign:
	@$(MAKE) -s ign > $@
