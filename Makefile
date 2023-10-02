.PHONY: all ign iso

all: ign

ign: ignition
	@$(MAKE) -C $<

.iso-livecd:
	@docker run --pull=always --rm -v ./$@:/data -w /data \
		quay.io/coreos/coreos-installer:release download \
			-s stable -p metal -f $@

iso: .iso-livecd
