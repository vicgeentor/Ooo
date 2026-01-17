{
  flake.modules.nixos.gunter =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.vim
      ];
    };
}
