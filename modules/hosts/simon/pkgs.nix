{
  flake.modules.nixos.simon =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        vim
        tmux
      ];
    };
}
