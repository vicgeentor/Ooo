# [Land of Ooo](https://adventuretime.fandom.com/wiki/Land_of_Ooo)

## Dendritic Design Pattern

This NixOS flake has been carefully constructed using the
beautiful
[dendritic design pattern](https://github.com/mightyiam/dendritic).

## Setup

The steps to correctly set up the systems in this repo are
defined in [setup.md](./docs/setup.md).

Every non-declarative part of this sytem setup is listed in
[imperative.md](./docs/imperative.md)

## Systems

### [jake](https://adventuretime.fandom.com/wiki/Jake)

The laptop that I use for everything.

### [bonnibel](https://adventuretime.fandom.com/wiki/Princess_Bubblegum)

My DigitalOcean VPS that is running
[Pangolin](https://github.com/fosrl/pangolin) through which
all my web services running on different hosts (e.g.
[simon](#simon)) are routed through a
[Newt](https://github.com/fosrl/newt) tunnel.

### [simon](https://adventuretime.fandom.com/wiki/Ice_King)

My home server that runs some web services:

- [nix-minecraft](https://github.com/Infinidoge/nix-minecraft)
- [Stirling-PDF](https://github.com/Stirling-Tools/Stirling-PDF)
- [your_spotify](https://github.com/Yooooomi/your_spotify)

### [neptr](https://adventuretime.fandom.com/wiki/Neptr)

A virtual NixOS machine.

### [bmo](https://adventuretime.fandom.com/wiki/BMO)

My Android phone.

## TODO

For all hosts:

- Implement
  [preservation](https://github.com/nix-community/preservation)
  or
  [impermanence](https://github.com/nix-community/impermanence)
- Start using
  [Nixos Facter](https://github.com/nix-community/nixos-facter)

For [jake](#jake):

- Make HDMI support great
- Use
  [lanzaboote](https://github.com/nix-community/lanzaboote)
  for secure boot
- Re-install system with better drive encryption

For [simon](#simon):

- Host the following services:
  - [immich](https://github.com/immich-app/immich)
  - [Dawarich](https://github.com/Freika/dawarich)
  - [FreshRSS](https://github.com/FreshRSS/FreshRSS)
  - [audiobookshelf](https://github.com/advplyr/audiobookshelf)
  - File storage
  - Probably more
- Switch to BTRFS for snapshotting and checksumming (with
  subvolumes for nix store, immich, etc.)
- Add a drive to for RAID1 redundancy
- Add a backup solution like
  [restic](https://github.com/restic/restic)
- See where I can add
  [Redis](https://github.com/redis/redis) caching
- Implement
  [Prometheus](https://github.com/prometheus/prometheus)
- Implement [Grafana](https://github.com/grafana/grafana)

For [bonnibel](#bonnibel):

- Implement
  [CrowdSec](https://docs.pangolin.net/self-host/community-guides/crowdsec)
- Better DDoS protection
