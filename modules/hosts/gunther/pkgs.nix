{
  flake.modules.nixos.gunther =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.vim
      ];
    };
}
