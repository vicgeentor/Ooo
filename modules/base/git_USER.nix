{ config, ... }:
{
  flake.modules.homeManager.base = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = config.flake.meta.vic.name;
          email = config.flake.meta.vic.email;
        };
        core.editor = config.flake.meta.vic.editor;
        init.defaultBranch = "main";
      };
    };
  };
}
