{ config, ... }:
{
  flake.modules.nixos.jake = {
    home-manager.users.${config.flake.meta.vic.username} = {
      imports = with config.flake.modules.homeManager; [
        base

        alacritty
        desktop-applications
        direnv
        dank
        dunst
        fastfetch
        fish
        fzf
        ghostty
        mpv
        niri
        nvim
        rofi
        scripts
        stylix
        thunar
        tmux
        zoxide
      ];
    };
  };
}
