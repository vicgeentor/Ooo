{ inputs, ... }:
{
  flake.modules.nixos.minecraft-server =
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
            level-seed = 5521138531714585408;
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
                  url = "https://cdn.modrinth.com/data/VSNURh3q/versions/lYSxkbzC/c2me-fabric-mc1.21.11-0.3.6%2Brc.1.0.jar";
                  sha512 = "ILR37S+UhJXbLdr3aCiFgOiwWgFXMNc/gOPYud1uQ8rp5fm4ET+Qi7Vls/pgYzw7fvo/OYGxC0TdzW9xrGRwtg==";
                };
                FabricAPI = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/gB6TkYEJ/fabric-api-0.140.2%2B1.21.11.jar";
                  sha512 = "r0RleX2AQBAhpq78jFRyAOfA+MrhNCmb8/r7wxD6gfBVJGsGFPwOA3U49KhE5VqtMKv6PGdGBCKFPfxCbwhtAA==";
                };
                FerriteCore = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/uXXizFIs/versions/eRLwt73x/ferritecore-8.0.3-fabric.jar";
                  sha512 = "vmAFQ+SZtZKG+UCfRkl1cK3FGTmuY+qhKsKeZ3jaJ9jHxs0LM0DYvMocyZzmF3mxqPUrmQ+eTpqTqpxkgpBSMQ==";
                };
                Krypton = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/O9LmWYR7/krypton-0.2.10.jar";
                  sha512 = "Tc1yKNGJDd/HjJn/KEtF+c9Aqud+9jWTCOJtBvoNk4NlJVaWr0zBLVJMRsSIbNzRkmjBZaK/Cig1IC/oV9pcqw==";
                };
                Lithium = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/gl30uZvp/lithium-fabric-0.21.2%2Bmc1.21.11.jar";
                  sha512 = "lGJVEAE+DarxwuK22KRjyTL/YiD5G6WwzV+GhlghXwRtlNB7NGVmD1dsTcJ6WqGD373ByTA/EYlLWyWh3Gw7tg==";
                };
                ResourcefulConfig = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/M1953qlQ/versions/nC6Zw8Lx/ResourcefulConfig-fabric-1.21.11-3.11.2.jar";
                  sha512 = "KsyZIW4ohoA4jkt2NbpSWgBJRTiwda16Sb5llAiE+mIjRtxWGrTs1f3oQlqkCPH1ZLSXPu+HzoXwfJyjFEYOQw==";
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
                  url = "https://cdn.modrinth.com/data/ayPU0OHc/versions/Vn3ke7rH/structure_layout_optimizer-1.1.3%2B1.21.11-fabric.jar";
                  sha512 = "rJKmoBVsodgXppIHxscSEcMBmxu9XBeXlftmjrl2Y0TuwBV+B9InMS660STLq1wiDcyp/8eC+u66rx0SIS7sXg==";
                };
              }
            );
          };
        };
      };

    };
}
