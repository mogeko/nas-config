# Ignition Generator

Producing a [FCOS/RHCOS Ignition Config](https://docs.fedoraproject.org/en-US/fedora-coreos/producing-ign) for NAS.

## Usage (Only for [@mogeko](https://github.com/mogeko) personal)

> **Warning** You can't use this Ignition directly. You should follow the guide to customize your own Ignition.

Install the system by `coreos-installer` in the Live CD:

```shell
sudo coreos-installer install /dev/sda \
    --ignition-url https://example.com/example.ign
```

Or, install by [PXE/iPXE](https://docs.fedoraproject.org/en-US/fedora-coreos/bare-metal/#_installing_from_the_network).
