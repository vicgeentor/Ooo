{ inputs, ... }:
{
  flake.modules.nixos.minecraft-server-26_1_2 =
    { pkgs, ... }:
    {
      imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];

      nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
      services.minecraft-servers = {
        enable = true;
        eula = true;

        servers.vicgeentor = {
          enable = true;
          package = pkgs.fabricServers.fabric-26_1_2.override { jre_headless = pkgs.openjdk25_headless; };

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
                  url = "https://cdn.modrinth.com/data/VSNURh3q/versions/utLSz8Lf/c2me-fabric-mc26.1.2-0.3.7%2Balpha.0.68.jar";
                  sha512 = "NN1gWqgf8ScPlpfPBFHKmmAj5X9Ic0aP8B/BniZNZDT7wMEI4ZSmpnWwJp3Rbtgp95oY6gbTLYms2j+/dnUwLw==";
                };
                FabricAPI = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/dZsorAUN/fabric-api-0.147.0%2B26.1.2.jar";
                  sha512 = "fjwF394NLFXRTvaOQDisHTM17Ujfyk28+ym4c9aYrgaevYXyR9igtIQ35IRCJUmhf/XLv+c00VkVPDvA4AN0Fw==";
                };
                FerriteCore = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/uXXizFIs/versions/d5ddUdiB/ferritecore-9.0.0-fabric.jar";
                  sha512 = "2B+pfhF4TBnUL4nC9DODHQB2A91xk87kX6F35KapxSs4SxmFhuBKD39jzZlv7XEzIleL3pqNtX4RiIVK5cvlhA==";
                };
                Krypton = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/kYAGItyj/krypton-0.3.0.jar";
                  sha512 = "FCMyECg6dvPPQ1o7jdvL1lqFjSsaELiP9kPAoBSG39K/GEO9NFbNT7hsuzsG8t6gxOZjsZdqSOlt4W07WnB+yQ==";
                };
                Lithium = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/R7MxYvuW/lithium-fabric-0.24.2%2Bmc26.1.2.jar";
                  sha512 = "kjGtBWZ9Tu8DSMcAv1Fgkp4Lcj2eFF/ZfH/O+Th6wubVJPsV2Z9H+Pg48dI1Mk/XUM3LZgO2OqtghdefvqqzGw==";
                };
                ResourcefulConfig = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/M1953qlQ/versions/GMW14IUd/ResourcefulConfig-4.0.1.jar";
                  sha512 = "fQ3Nh7BQwFXdoQDA0eSRdHnspkyG6Cw5M4PlsE7jKhGRJghvzyUNY5OVetyxkkPcv+a0rmisVslDrIrL5MKRZA==";
                };
                ScalableLux = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/Ps1zyz6x/versions/gYbHVCz8/ScalableLux-0.2.0%2Bfabric.2b63825-all.jar";
                  sha512 = "SFZaTYocvWI/AEQIbZcfLAzxxA4dC2Y2ph1BUS9MHB3f81h52duiSwiKZw7iVOLVhC0Towttdt8jcG+pTqSliw==";
                };
                ServerCore = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/4WWQxlQP/versions/P8k080Af/servercore-fabric-1.5.16%2B26.1.jar";
                  sha512 = "uoMix1aWgPQPQWJpNiP0iMF98OjTlKruILvI4aMJeqswk4luqW5oOaNvgXwWV77Ym6UBMW+jmAoVpcBhji0ang==";
                };
                StructureLayoutOptimizer = pkgs.fetchurl {
                  url = "https://cdn.modrinth.com/data/ayPU0OHc/versions/JwbecFqq/structure_layout_optimizer-1.1.4%2B26.1-fabric.jar";
                  sha512 = "0KRD5acdxqQPY0W0m3Ou5SkNVyb2ilsF07Mbn/cSYt0phlGN+KVg8gl+dYS5RP9GLWIUmfXe3hCvpiSjQ1nozA==";
                };
              }
            );
          };
        };
      };

    };
}
