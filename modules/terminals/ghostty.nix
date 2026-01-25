{ inputs, ... }:
{
  flake.modules.homeManager.ghostty =
    { pkgs, ... }:
    {
      programs.ghostty = {
        enable = true;
        package = inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;
        systemd.enable = true;
        settings = {
          # Font
          font-size = 14;
          # font-feature = [
          #   # The next three lines disable all ligatures
          #   "-calt"
          #   "-liga"
          #   "-dlig"
          # ];
          bold-color = "bright"; # Bold text will use the bright color palette

          # Theme
          theme = "Rose Pine";
          background = "#0F0F0F";

          # Cursor
          cursor-style = "block";
          cursor-style-blink = false;
          shell-integration-features = "no-cursor";

          # Window
          window-padding-x = 6;
          window-padding-y = 6;
          window-padding-balance = true;
          window-decoration = false;
          window-width = 100;
          window-height = 25;

          # Keybinds
          keybind = [
            "ctrl+backspace=ignore"
            "shift+enter=ignore"
            "ctrl+enter=text:✗"
            "ctrl+shift+enter=text:✓"
            "ctrl+i=text:◆"
            "ctrl+m=text:▶"
            "ctrl+comma=text:★"
            "ctrl+shift+h=text:●"
          ];

          # Other
          clipboard-trim-trailing-spaces = true;
          confirm-close-surface = false;
          quit-after-last-window-closed = false;
        };
      };
    };
}
