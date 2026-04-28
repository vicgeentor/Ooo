{ inputs, ... }:

{
  flake.modules.nixos.jake =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
        bash-language-server
        bat
        bitwarden-desktop
        brightnessctl
        cowsay
        discord
        efibooteditor
        element-desktop
        ente-auth
        eza # ls replacement
        fd # Finding files
        ffmpeg
        (fortune.override { withOffensive = true; })
        ghostscript
        gimp3
        glib
        gnumake
        google-chrome
        gtk3 # Just for `gtk-launch <.desktop file>`
        unixtools.ifconfig
        imagemagick
        jq
        mermaid-cli
        nixd # Nix lsp
        inputs.givenv.packages.${pkgs.stdenv.hostPlatform.system}.default
        obs-studio
        kdePackages.okular # pdf
        pavucontrol # Audio controls
        pinta # Paint
        playerctl # Needed for pausing, skipping songs, etc.
        qimgv # Image viewer
        qbittorrent
        R
        servo
        signal-desktop
        spotify
        sshfs
        teams-for-linux
        thunderbird-latest # Mail client
        unrar
        unzip
        vulkan-tools
        wev # xev for wayland
        wget
        yt-dlp
        zapzap # Whatsapp
        zip
        zotero
      ];
    };
}
