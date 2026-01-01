{ config, ... }:
{
  flake.modules.nixos.jake = {
    home-manager.users.${config.flake.meta.vic.username} = {
      imports = with config.flake.modules.homeManager; [
        base

        alacritty
        btop
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
        my-scripts
        nvim
        onedrive
        quickshell
        rofi
        stylix
        thunar
        tmux
        zoxide
        zsh
      ];
    };
  };
}
