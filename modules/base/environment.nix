{
  flake.modules.nixos.base = {
    environment = {
      sessionVariables = {
        NIXOS_OZONE_WL = "1";
        GSK_RENDERER = "ngl";
      };
      localBinInPath = true;
    };
  };
}
