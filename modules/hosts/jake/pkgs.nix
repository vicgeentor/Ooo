{ inputs, ... }:

{
  flake.modules.nixos.jake =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
        bash-language-server
        bitwarden-desktop
        brightnessctl
        discord
        efibooteditor
        element-desktop
        ente-auth
        evince # pdf
        eza # ls replacement
        fd # Finding files
        ffmpeg
        ghostscript
        gimp3
        glib
        gnumake
        google-chrome
        gtk3 # Just for `gtk-launch <.desktop file>`
        unixtools.ifconfig
        imagemagick
        inkscape
        jq
        mermaid-cli
        networkmanagerapplet
        nixd # Nix lsp
        inputs.nix-devshells.packages.${pkgs.stdenv.hostPlatform.system}.default
        obs-studio
        kdePackages.okular
        pavucontrol # Audio controls
        pinta # Paint
        playerctl # Needed for pausing, skipping songs, etc.
        protonvpn-gui
        qimgv # Image viewer
        qbittorrent
        R
        signal-desktop
        spotify
        sshfs
        thunderbird-latest # Mail client
        unrar
        unzip
        vulkan-tools
        wev # xev for wayland
        wget
        yt-dlp
        zapzap # Whatsapp
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight
        zip
        zotero-beta
      ];
    };
}
