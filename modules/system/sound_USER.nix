{ config, ... }:
{
  flake.modules.nixos.sound = {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      audio.enable = true;
      # systemWide = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
        extraConfig = {
          "51-bluez-a2dp" = {
            "monitor.bluez.properties" = {
              # Only auto-connect A2DP, not the headset (HFP/HSP) profiles
              "bluez5.auto-connect" = [ "a2dp_sink" ];
              # Prefer LDAC, then fall back
              "bluez5.codecs" = [
                "ldac"
                "aac"
                "sbc_xq"
                "sbc"
              ];
            };
          };
          # Don't automatically flip to the headset profile when an app opens the mic
          "52-bluez-no-autoswitch" = {
            "wireplumber.settings" = {
              "bluetooth.autoswitch-to-headset-profile" = false;
            };
          };
        };
      };
    };
    users.users.${config.flake.meta.vic.username}.extraGroups = [
      "audio"
      "pipewire"
    ];
  };
}
