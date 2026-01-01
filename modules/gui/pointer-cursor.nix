# Module not needed due to stylix
{
  flake.modules.homeManager.pointer-cursor =
    { pkgs, ... }:
    {
      home = {
        pointerCursor = {
          gtk.enable = true;
          # x11.enable = true;
          package = pkgs.rose-pine-cursor;
          name = "BreezeX-RosePine-Linux";
          size = 20;
        };
      };
    };
}
