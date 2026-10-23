{
  flake.modules.nixos.vpn = {
    networking.firewall.checkReversePath = false;
  };
}
