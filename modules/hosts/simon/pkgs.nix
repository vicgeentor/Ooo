{
  flake.modules.nixos.simon =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.vim
      ];
    };
}
