# Installation

> [!IMPORTANT]
> Many of the home-manager modules rely on
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

# Setting up users

For setting up a new user, you can follow these steps:

1. Inside [users.nix](../modules/base/users.nix), add an
   attribute set `meta.<USERNAME>` to `flake`:

   ```nix
   {
     flake = {
       meta.<USERNAME> = {
         email = "<EMAIL>";
         username = "<USERNAME>";
         editor = "<EDITOR>";
       };
     # ...
     };
   }
   ```

2. Inside [users.nix](../modules/base/users.nix), add an
   age-encrypted hashed password file to
   `modules.nixos.base`:

   ```nix
   {
     flake = {
       # ...
       modules = {
         nixos.base = nixosArgs: {
           age.secrets.<USERNAME>-user-password.file = ../../_secrets/<USERNAME>-user-password.age;
           # ...
         };
       };
     };
   }
   ```

   To make this file, go to the [\_secrets](../_secrets)
   directory in the root of this repo, add an attribute
   `"<USERNAME>-user-password.age"` to
   [secrets.nix](../_secrets/secrets.nix) and run
   `agenix -e <USERNAME>-user-password.age` and paste the
   hashed password made with the `mkpasswd` inside of the
   editor that opens up. See the
   [agenix documentation](https://github.com/ryantm/agenix#tutorial)
   for more info about this.

   > [!IMPORTANT]
   > This file should contain a hashed password
   > made with the `mkpasswd` command. It should **not**
   > contain a plain text password.

3. Inside [users.nix](../modules/base/users.nix), add an
   attribute set to the `users` attribute and add the user
   to `nix.settings.trusted-users`:

   ```nix
   {
     flake = {
       # ...
       modules = {
         nixos.base = nixosArgs: {
           # ...
           users = {
             # ...
             users = {
               ${config.flake.meta.<USERNAME>.username} = {
                 isNormalUser = true;
                 hashedPasswordFile = nixosArgs.config.age.secrets.<USERNAME>-user-password.path;
                 home = "/home/${config.flake.meta.<USERNAME>.username}";
                 extraGroups = [
                   "input"
                   "systemd-journal"
                   "wheel"
                   "<OTHER_GROUP>"
                 ];
               }
             };
           };
           
           nix.settings.trusted-users = [ config.flake.meta.<USERNAME>.username ];
         };
       };
     };
   }
   ```

4. In every file that ends with `_USER.nix`, you may want to
   add some attributes of the `config.flake.meta.<USERNAME>`
   set to appropriate modules. Inside these files, you can
   see how this is already being done for the user `vic`.

# Imperative steps for setup

Every non-declarative part of this sytem setup is listed in
[imperative.md](./imperative.md)
