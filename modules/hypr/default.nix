{ inputs, ... }:
{
  flake.modules.nixos.hypr =
    {
      pkgs,
      lib,
      ...
    }:
    {
      programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage =
          inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      };

      environment.systemPackages = with pkgs; [
        hyprpolkitagent
        wl-clipboard # Clipboard manager
        wl-gammarelay-rs # blue light filter
        wl-screenrec
        xorg.xeyes # Run `xeyes` to show xwayland windows
      ];

      systemd = {
        user.services = {
          hyprpolkitagent = {
            description = "Hyprpolkitagent service";
            wantedBy = [ "graphical-session.target" ];
            wants = [ "graphical-session.target" ];
            after = [ "graphical-session.target" ];
            serviceConfig = {
              Type = "simple";
              ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
              Restart = "on-failure";
              RestartSec = 1;
              TimeoutStopSec = 10;
            };
          };
        };
      };

      hardware = {
        graphics = {
          package = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.mesa;
          package32 = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.mesa;
        };
      };

      nix.settings = {
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
      };
    };

  flake.modules.homeManager.hypr =
    hmArgs@{ pkgs, ... }:
    {
      home.file = {
        ".config/hypr".source =
          hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/hypr";
      };

      home.packages = with pkgs; [
        grimblast # Hyprland wrapper for grim and slurp
        hyprpicker # Color picker
        hyprprop # xprop for Hyprland
        hyprpaper
        inputs.hyprshutdown.packages.${pkgs.stdenv.hostPlatform.system}.default
        hyprlock
        hypridle
      ];
      programs.zsh.profileExtra = ''
        if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
          exec start-hyprland
        fi
      '';
    };
}
