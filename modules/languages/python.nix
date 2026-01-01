{
  flake.modules.nixos.python =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.python313 ];
    };
}
