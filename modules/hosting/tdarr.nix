{
  flake.modules.nixos.tdarr =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.tdarr ];
    };
}
