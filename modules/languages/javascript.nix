{
  flake.modules.homeManager.javascript =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        nodejs
        typescript-language-server
        yarn
      ];
    };
}
