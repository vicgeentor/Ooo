{
  flake.modules.nixos.typst =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        typst
        tinymist
      ];
    };
}
