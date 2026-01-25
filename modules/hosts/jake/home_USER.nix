{ config, ... }:
{
  flake.modules.nixos.jake = {
    home-manager.users.${config.flake.meta.vic.username} = {
      imports = with config.flake.modules.homeManager; [
        base

        alacritty
        desktop-applications
        direnv
        dunst
        fastfetch
        fish
        fzf
        ghostty
        hypr
        mpv
        nvim
        onedrive
        quickshell
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
