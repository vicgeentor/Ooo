{ config, ... }:
{
  flake = {
    meta.vic = {
      email = "victenbokum@gmail.com";
      name = "vicgeentor";
      username = "vic";
      editor = "nvim";
    };

    modules = {
      nixos.base = {
        users.users.${config.flake.meta.vic.username} = {
          isNormalUser = true;
          initialPassword = "password";
          home = "/home/${config.flake.meta.vic.username}";
          extraGroups = [ "input" ];
        };

        nix.settings.trusted-users = [ config.flake.meta.vic.username ];
      };
    };
  };
}
