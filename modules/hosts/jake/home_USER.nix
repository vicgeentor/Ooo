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
        fzf
        ghostty
        hypr
        javascript
        latex
        libreoffice
        markdown
        minecraft
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
        zsh
      ];
    };
  };
}
