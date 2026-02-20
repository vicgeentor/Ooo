{
  flake.modules.nixos.typst =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        tinymist
        typst
        typstyle
      ];
    };
}
