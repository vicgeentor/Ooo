{
  flake.modules.homeManager.tmux =
    hmArgs@{ pkgs, ... }:
    {
      home.packages = [ pkgs.tmux ];
      home.file = {
        ".config/tmux/tmux.conf".source =
          hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/terminals/tmux/tmux.conf";
      };
    };
}
