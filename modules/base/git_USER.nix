{ config, ... }:
{
  flake.modules.homeManager.base = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = config.flake.meta.vic.name;
          email = config.flake.meta.vic.email;
          signingkey = "/home/${config.flake.meta.vic.username}/.ssh/id_ed25519.pub";
        };
        core.editor = config.flake.meta.vic.editor;
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        gpg.format = "ssh";
      };
    };
  };
}
