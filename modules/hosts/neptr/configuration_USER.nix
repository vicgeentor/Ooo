{
  flake.modules.nixos.neptr =
    { lib, ... }:
    {

      networking.hostName = "neptr";
      system.stateVersion = "25.11";

      nix.settings = {
        max-jobs = lib.mkForce 2;
      };

    };
}
