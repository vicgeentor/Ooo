{
  flake.modules.homeManager.pointer-cursor =
    { pkgs, ... }:
    {
      home = {
        pointerCursor = {
          enable = true;
          gtk.enable = true;
          x11.enable = true;
          package = pkgs.rose-pine-cursor;
          name = "BreezeX-RosePine-Linux";
          size = 20;
        };
      };
    };
}
