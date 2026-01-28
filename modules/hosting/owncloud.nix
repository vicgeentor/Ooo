{
  flake.modules.nixos.owncloud = nixosArgs: {
    age.secrets.ocis.file = ../../_secrets/ocis.age;

    services.ocis = {
      enable = true;
      environmentFile = nixosArgs.config.age.secrets.ocis.path;
    };

    # services.collabora-online = {
    #   enable = true;
    #   aliasGroups = [
    #     {
    #       host = "https://office.vicgeentor.nl";
    #     }
    #   ];
    #   settings = {
    #     server_name = "office.vicgeentor.nl";
    #     ssl = {
    #       enable = false;
    #       termination = true;
    #     };
    #     net = {
    #       proto = "IPv4";
    #       listen = "loopback";
    #     };
    #   };
    # };
  };
}
