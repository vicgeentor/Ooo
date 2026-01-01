{
  flake.modules.homeManager.fzf =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.fzf ];

      programs.fzf = {
        enable = true;
        defaultOptions = [
          "--layout=reverse"
          "--border"
        ];
      };
    };
}
