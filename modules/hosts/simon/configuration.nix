{
  flake.modules.nixos.simon = {

    networking.hostName = "simon";
    system.stateVersion = "24.11";

    boot = {
      loader.efi.canTouchEfiVariables = true;
      extraModprobeConfig = ''
        options snd_hda_intel power_save=0
      '';
    };
  };
}
