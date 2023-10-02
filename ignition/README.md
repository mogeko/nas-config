# Ignition

This is the [Ignition](https://docs.fedoraproject.org/en-US/fedora-coreos/producing-ign) for setup the [Fedora CoreOS](https://docs.fedoraproject.org/en-US/fedora-coreos) system.

## Usage

Install the system by `coreos-installer` in the Live CD:

> Warning You should **NEVER** use this Ignition directly. You SHOULD create your own Ignition.

```bash
# Let's assume that /dev/sda is the system disk.
sudo coreos-installer install /dev/sda \
    --ignition-url https://mogeko.github.io/nas-config/ignition.json
```
