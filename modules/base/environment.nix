{
  flake.modules.nixos.base = {
    environment = {
      sessionVariables = {
        NIXOS_OZONE_WL = "1";
        GSK_RENDERER = "ngl";
        GTK_IM_MODULE = "simple"; # See https://github.com/ghostty-org/ghostty/discussions/8899#discussioncomment-14717979
      };
      localBinInPath = true;
    };
  };
}
