{
  flake.modules.homeManager.nix-index = {
    programs = {
      nix-index = {
        enable = true;
        enableZshIntegration = false;
      };
      nix-index-database.comma.enable = true;
    };
  };
}
