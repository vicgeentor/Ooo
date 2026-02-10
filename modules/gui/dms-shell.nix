{ inputs, ... }:
{
  flake.modules.nixos.dms-shell = {
    imports = [ inputs.dms.nixosModules.dank-material-shell ];

    programs.dank-material-shell = {
      enable = true;
      systemd.enable = true;
      enableDynamicTheming = false;
    };
  };
}
