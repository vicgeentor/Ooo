{ inputs, ... }:
{
  flake.modules.nixos.minecraft-server-1_21_11 =
    { pkgs, ... }:
    {
      imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];

      nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
      services.minecraft-servers = {
        enable = true;
        eula = true;

        servers.vicgeentor = {
          enable = true;
          package = pkgs.fabricServers.fabric-1_21_11;

          autoStart = true;

          serverProperties = {
            difficulty = "normal";
            gamemode = "survival";
            max-players = 8;
            motd = "vic's mc servertj";
            server-port = 25565;
            white-list = true;
            view-distance = 14;
            simulation-distance = 10;
            pause-when-empty-seconds = 10;
            # TODO: level-seed = ...;
          };

          whitelist = {
            kloevbasserts = "0b755d62-92c1-423a-b20b-a32c7ca2919d";
            slaapwandelaar = "b8d4248b-f82a-40f5-a180-78ad52effe64";
          };

          operators = {
            kloevbasserts = {
              uuid = "0b755d62-92c1-423a-b20b-a32c7ca2919d";
              level = 4;
              bypassesPlayerLimit = true;
            };
            slaapwandelaar = {
              uuid = "b8d4248b-f82a-40f5-a180-78ad52effe64";
              level = 3;
            };

          };

          symlinks = {
            mods = pkgs.linkFarmFromDrvs "mods" (
              builtins.attrValues {
                C2ME = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/VSNURh3q/versions/olrVZpJd/c2me-fabric-mc1.21.11-0.3.6.0.0.jar";
                  sha512 = "ybERAFcvtxwwgP8RsBFGdiToATuZQqreCaXHfrYrMolme61wUB3eqPNd6wpdJohLefdtTtES0yNCRxynOEt4ig==";
                };
                FabricAPI = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/i5tSkVBH/fabric-api-0.141.3%2B1.21.11.jar";
                  sha512 = "wgwBfiPW0ndGkNDdd0zshMFr+sVGHaLZNFoc2V7uSVsZVDM8Qh49HGYYYoTSSkM/awzO2AIfYuC/phfSOE0EcQ==";
                };
                FerriteCore = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/uXXizFIs/versions/Ii0gP3D8/ferritecore-8.2.0-fabric.jar";
                  sha512 = "MhCSaoLrMu/ZvOur4vbAU9r1xDN+68bVusupbSg1EK+95kbn4ZV1HeeV7HCi6kT+93y1S/Isjle7gy1iF0GIaQ==";
                };
                Krypton = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/O9LmWYR7/krypton-0.2.10.jar";
                  sha512 = "Tc1yKNGJDd/HjJn/KEtF+c9Aqud+9jWTCOJtBvoNk4NlJVaWr0zBLVJMRsSIbNzRkmjBZaK/Cig1IC/oV9pcqw==";
                };
                Lithium = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/Ow7wA0kG/lithium-fabric-0.21.4%2Bmc1.21.11.jar";
                  sha512 = "8UpcPS+teGNHyiUIP5AhOWlPYYt8EDlH8v0Genxe6Ipj4e+JJvfWk+p57X0A9XMXuud++cLWML9e0BrJenUrlA==";
                };
                ResourcefulConfig = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/M1953qlQ/versions/8bR7M6K7/ResourcefulConfig-fabric-1.21.11-3.11.3.jar";
                  sha512 = "wJVW1Gc/kZU6FNcZxVIjgOwHVhd/P3nNvKvy1d2hjrQA0ivtCa73hPFfvTlT8r5pzm4bZayZrDbEYcvS5QymfQ==";
                };
                ScalableLux = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/Ps1zyz6x/versions/PV9KcrYQ/ScalableLux-0.1.6%2Bfabric.c25518a-all.jar";
                  sha512 = "cpUVwedc+NnNcE8Ss0h925Zkz5ko57hbEiicj7vH7YLQIR4YUTdcvVs4WCC0/tvD9hcDj/9eMLMCBHsJNwQq5w==";
                };
                ServerCore = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/4WWQxlQP/versions/zg8VIycZ/servercore-fabric-1.5.15%2B1.21.11.jar";
                  sha512 = "lkOSdp5T+XZEZuJgRFUvYOkRN/SHtJ2YqFvU3AOrjpZfDGm8GkPpbvVzfNjxqbt1zAoMCd0wurZ4bYq0u+puAQ==";
                };
                StructureLayoutOptimizer = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/ayPU0OHc/versions/YDgvKeWI/structure_layout_optimizer-1.1.4%2B1.21.11-fabric.jar";
                  sha512 = "+txO34ArpMop7+r0xfDRM85bjCoE0/3Sk4WFFn29zpiPqNikODXvgc3VwK0qkbI8fLvpF1J1uEBE9V+tY/t/Ig==";
                };
              }
            );
          };
        };
      };

    };
}
