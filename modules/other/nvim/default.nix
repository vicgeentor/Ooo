{ inputs, ... }:
{
  flake.modules.nixos.nvim =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };

  flake.modules.homeManager.nvim =
    hmArgs@{ pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          gcc
          lua5_1
          lua-language-server
          luajitPackages.luarocks
          nodejs
          ripgrep
          tree-sitter
          yarn
        ];
        file = {
          ".config/nvim".source =
            hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/other/nvim";
        };
      };
    };
}
