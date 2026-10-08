{ config, ... }:
{
  flake.modules.nixos.jake = {
    home-manager.users.${config.flake.meta.vic.username} = {
      imports = with config.flake.modules.homeManager; [
        base

        alacritty
        desktop
        direnv
        default-terminal
        dunst
        fastfetch
        fish
        fonts
        fzf
        ghostty
        gtk
        mpv
        niri
        noctalia
        nvim
        pointer-cursor
        rofi
        scripts
        thunar
        tmux
        zoxide
      ];
    };
  };
}
