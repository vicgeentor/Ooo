{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        btop
        git
        killall
        pciutils
        tmux
      ];
    };
}
