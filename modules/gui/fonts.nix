{
  flake.modules.nixos.fonts =
    { pkgs, ... }:
    {
      fonts = {
        enableDefaultPackages = true;
        packages = with pkgs; [
          nerd-fonts.atkynson-mono
          nerd-fonts.jetbrains-mono
          nerd-fonts.ubuntu
          nerd-fonts.ubuntu-mono
          nerd-fonts.ubuntu-sans

          atkinson-hyperlegible-next
          corefonts # Microsoft
          helvetica-neue-lt-std
          ibm-plex
          lmodern
          libertine
          material-symbols
          noto-fonts-color-emoji
          vista-fonts # Microsoft
        ];

        fontconfig = {
          defaultFonts = {
            serif = [ "Ubuntu Nerd Font" ];
            sansSerif = [ "UbuntuSans Nerd Font" ];
            monospace = [ "JetBrainsMono Nerd Font" ];
            emoji = [ "Noto Color Emoji" ];
          };
        };
      };
    };
}
