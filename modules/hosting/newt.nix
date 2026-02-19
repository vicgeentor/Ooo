{
  flake.modules.nixos.newt = {
    services.newt = {
      enable = true;

      settings = {
        endpoint = "https://admin.vicgeentor.nl";
      };
    };
  };
}
