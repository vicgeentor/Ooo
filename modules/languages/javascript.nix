{
  flake.modules.nixos.javascript =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        nodejs
        typescript-language-server
        yarn
      ];
    };
}
