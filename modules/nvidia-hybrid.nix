{
  flake.modules.nixos.nvidia-hybrid = {
    hardware = {
      nvidia = {
        prime = {
          offload = {
            enable = false;
            enableOffloadCmd = false;
          };
          sync.enable = true;
          # WARNING: make sure to set nvidiaBusId and intelBusId/amdBusId in specific host module
        };
      };
    };

    # specialisation = {
    #   # Enable a second boot entry with nvidia offload instead of sync when having
    #   # a dual gpu setup
    #   nvidia-offload.configuration = {
    #     environment.etc."specialisation".text = "nvidia-offload"; # Needed for nh (see https://github.com/nix-community/nh#specialisations-support)
    #     system.nixos.tags = ["nvidia-offload"];
    #     hardware.nvidia = {
    #       prime = {
    #         offload = {
    #           enable = lib.mkForce true;
    #           enableOffloadCmd = lib.mkForce true;
    #         };
    #         sync.enable = lib.mkForce false;
    #       };
    #     };
    #   };
    # };
  };
}
