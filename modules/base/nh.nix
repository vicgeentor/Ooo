{
  flake.modules.nixos.base = {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "Mon 05:00";
        extraArgs = "--keep 5 --no-direnv";
      };
    };
  };
}
