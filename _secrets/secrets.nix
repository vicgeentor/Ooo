let
  bonnibel-system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINB4wKQlCgdpcRDeDwCP2zFWMR5zW282V9ieQJQNg48v";
  simon-system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDELcORAKNYJcOr1rSfXxxl73pYcGqXxUnSHIbphZ94m";
  jake-system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHXT5yrR/ahmtnboRuQe4H2wfZOdvKFAsOEbmMOXsh8Y";
  gunter-system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPAahwTcSwqzDKnV4KhxoBbNPdXDTjd5OlU17Vu3YdZ7";

  jake-vic = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHlItoZy7MALjM6h9CrEKFEZkYw5R7Clt5vB8RcEmFgH";
in
{

  "cloudflare-dns-api.age".publicKeys = [
    jake-vic
    bonnibel-system
    simon-system
  ];

  "email-password-vic-at-vicgeentornl.age".publicKeys = [
    jake-vic
    bonnibel-system
  ];

  "email-password-vic-at-vicgeentornl-grafana.age".publicKeys = [
    jake-vic
    simon-system
  ];

  "grafana.age".publicKeys = [
    jake-vic
    simon-system
  ];

  "newt-gunter.age".publicKeys = [
    jake-vic
    gunter-system
  ];

  "newt-simon.age".publicKeys = [
    jake-vic
    simon-system
  ];

  "ocis.age".publicKeys = [
    jake-vic
    gunter-system
  ];

  "pangolin.age".publicKeys = [
    jake-vic
    bonnibel-system
  ];

  "recyclarr-yaml.age".publicKeys = [
    jake-vic
    simon-system
  ];

  "smtp-sasl-password-maps.age".publicKeys = [
    jake-vic
    bonnibel-system
  ];

  "tailscale.age".publicKeys = [
    jake-vic
    bonnibel-system
    jake-system
    simon-system
    gunter-system
  ];

  "transmission-settings-json.age".publicKeys = [
    jake-vic
    simon-system
  ];

  "vic-user-password.age".publicKeys = [
    jake-vic
    bonnibel-system
    jake-system
    simon-system
    gunter-system
  ];

  "wg-conf.age".publicKeys = [
    jake-vic
    simon-system
  ];

  "your-spotify.age".publicKeys = [
    jake-vic
    simon-system
  ];

}
