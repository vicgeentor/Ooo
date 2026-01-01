{ config, ... }:
{
  flake.modules.nixos.sound = {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      audio.enable = true;
      systemWide = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    users.users.${config.flake.meta.vic.username}.extraGroups = [
      "audio"
      "pipewire"
    ];
  };
}
