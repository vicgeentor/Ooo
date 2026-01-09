{ config, ... }:
{
  flake = {
    meta.vic = {
      email = "github@vicgeentor.nl";
      username = "vic";
      editor = "nvim";
    };

    modules = {
      nixos.base = nixosArgs: {
        age.secrets.vic-user-password.file = ../../_secrets/vic-user-password.age;

        users = {
          mutableUsers = false;
          users = {
            ${config.flake.meta.vic.username} = {
              isNormalUser = true;
              hashedPasswordFile = nixosArgs.config.age.secrets.vic-user-password.path;
              home = "/home/${config.flake.meta.vic.username}";
              extraGroups = [
                "input"
                "systemd-journal"
                "wheel"
              ];
            };
          };
        };

        nix.settings.trusted-users = [ config.flake.meta.vic.username ];
      };
    };
  };
}
