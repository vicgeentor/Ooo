{
  flake.modules.nixos.fonts =
    { pkgs, ... }:
    {
      fonts = {
        enableDefaultPackages = true;
        packages = with pkgs; [
          nerd-fonts.jetbrains-mono
          nerd-fonts.ubuntu
          nerd-fonts.ubuntu-mono
          nerd-fonts.ubuntu-sans
          noto-fonts-color-emoji
          helvetica-neue-lt-std
          lmodern
          libertine
          corefonts # Microsoft
          vista-fonts # Microsoft
          material-symbols
          ibm-plex
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
