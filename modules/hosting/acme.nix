{
  flake.modules.nixos.acme = {
    security.acme = {
      acceptTerms = true;
      defaults.email = "security@vicgeentor.nl";
    };
  };
}
