{
  flake.modules.nixos.neptr =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.vim
      ];
    };
}
