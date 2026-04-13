{ config, inputs, ... }:
{
  flake.modules.nixos.sound =
    { pkgs, ... }:
    {
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        package = inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.pipewire;
        audio.enable = true;
        systemWide = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        jack.enable = true;
        pulse.enable = true;
        wireplumber.enable = true;
        wireplumber.package =
          inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.wireplumber;

      };
      users.users.${config.flake.meta.vic.username}.extraGroups = [
        "audio"
        "pipewire"
      ];
    };
}
