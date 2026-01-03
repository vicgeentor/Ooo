# Installation

> [!IMPORTANT] Many of the home-manager modules rely on
> symlinks to files in this repo. To ensure that these
> symlinks work, the location of this repo should be ~/Ooo.

## With [nixos-anywhere](https://github.com/nix-community/nixos-anywhere)

```
nix run github:nix-community/nixos-anywhere -- --flake <PATH TO THIS FLAKE>.#<CONFIGURATION NAME> --target-host root@<TARGET IP> -i <PATH TO PRIVATE SSH KEY>
```

## Imperative installation

Format any extra disks that will be a part of the BTRFS
filesystem (make sure to add these devices to the btrfs
arguments in disk-config.nix):

```
sudo mkfs.btrfs -f /dev/disk/by-id/<device-id>
```

Partitioning with
[disko](https://github.com/nix-community/disko/blob/master/docs/quickstart.md):

```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /path/to/disk-config.nix
```

Installation (limiting max-jobs and number of cores to
prevent memory overflow):

```
sudo nixos-install --no-root-passwd --max-jobs 2 --cores 2 --flake /path/to/flake#hostname
```

Reboot:

```
reboot
```

# Imperative steps for setup

Every non-declarative part of this sytem setup is listed in
[imperative.md](./imperative.md)
