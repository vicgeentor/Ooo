{
  flake.modules.homeManager.onedrive =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        onedrive
        openssl # Needed
      ];
      home.file.".config/onedrive/config".text = ''
        sync_dir="~/personal"
        skip_dir=".git"
      '';
    };
}
