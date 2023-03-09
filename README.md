# Ignition Generator

Producing a [FCOS](https://docs.fedoraproject.org/en-US/fedora-coreos)/[RHCOS](https://access.redhat.com/documentation/en-us/openshift_container_platform/4.8/html/architecture/architecture-rhcos) [Ignition Config](https://docs.fedoraproject.org/en-US/fedora-coreos/producing-ign) for NAS.

## Usage (Only for [@mogeko](https://github.com/mogeko) personal)

> **Warning** You should **NEVER use this Ignition** directly. You **SHOULD** [create your own Ignition](#usage-for-you).

Install the system by `coreos-installer` in the [Live CD](https://docs.fedoraproject.org/en-US/fedora-coreos/bare-metal/#_installing_from_live_iso):

```shell
# Let's assume that /dev/sda is the system disk.
sudo coreos-installer install /dev/sda \
    --ignition-url https://mogeko.github.io/nas-ignition/nas.ign
```

Or, install by [PXE/iPXE](https://docs.fedoraproject.org/en-US/fedora-coreos/bare-metal/#_installing_from_the_network).

## Usage (For You)

1. Create your own repo from this [template](https://github.com/mogeko/nas-ignition/generate).

2. Use [`ssh-keygen`](https://wiki.archlinux.org/title/SSH_keys) and [`mkpasswd`](https://docs.fedoraproject.org/en-US/fedora-coreos/authentication/#_using_password_authentication) to generate **SSH public keys** and **the hash for user's password**.

```shell
# Generate a new pair of SSH keys.
# By default, your SSH public key is placed in ~/.ssh/id_rsa.pub
ssh-keygen -C your.email@example.com && cat ${HOME}/.ssh/id_rsa.pub
# Enter the password you want to set, and mkpasswd will return its hash.
docker run -ti --rm quay.io/coreos/mkpasswd --method=yescrypt
```

3. In your own repo, find **Actions** -> **lgnition Generator** -> **Run workflow**.

   Fill in the _**username**_, _**the hash for user's password**_ and _**SSH public key**_ according to the prompt,

   and then run!

<img width="1440" alt="run-workflow" src="https://user-images.githubusercontent.com/26341224/223501029-cd36d021-6726-4c82-974a-474f56759403.png">

GitHub Action will push your Ignition (`nas.ign`) to the GitHub Page, that is:

```txt
<github-username>.github.io/<repo>/nas.ign
```

## License

The code in this project is released under the [MIT License](./LICENSE).
