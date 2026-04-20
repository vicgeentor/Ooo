{ inputs, ... }:
{
  flake.modules.nixos.nvim =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];

      environment.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };
    };

  flake.modules.homeManager.nvim =
    hmArgs@{ pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          inputs.cornelis.packages.${pkgs.stdenv.hostPlatform.system}.default
          gcc
          lua5_1
          lua-language-server
          luajitPackages.luarocks
          nodejs
          ripgrep
          stylua
          inputs.tree-sitter.packages.${pkgs.stdenv.hostPlatform.system}.default
          yarn
        ];
        file = {
          ".config/nvim".source =
            hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/other/nvim";
        };
      };
    };

  perSystem.treefmt.programs.stylua.enable = true;
}
