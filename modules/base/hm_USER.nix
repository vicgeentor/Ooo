{
  config,
  inputs,
  ...
}:
{
  flake.modules.nixos.base = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      extraSpecialArgs.hasGlobalPkgs = true;
      # https://github.com/nix-community/home-manager/issues/6770
      #useUserPackages = true;

      backupFileExtension = "hmbak";

      users.${config.flake.meta.vic.username}.imports = [
        (
          { osConfig, ... }:
          {
            home.stateVersion = osConfig.system.stateVersion;
          }
        )
        config.flake.modules.homeManager.base
      ];
    };
  };

  flake.modules.homeManager.base = {
    programs.home-manager.enable = true;
    home = {
      username = config.flake.meta.vic.username;
      homeDirectory = "/home/${config.flake.meta.vic.username}";
    };
  };
}
