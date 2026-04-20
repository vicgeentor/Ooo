{ inputs, ... }:
{
  flake.modules.nixos.nvim =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default

        # These are mostly dependencies of plugins
        inputs.cornelis.packages.${pkgs.stdenv.hostPlatform.system}.default
        vscode-extensions.ms-vscode.cpptools
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

      environment.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };
    };

  flake.modules.homeManager.nvim = hmArgs: {
    home.file = {
      ".config/nvim".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/other/nvim";
    };
  };

  perSystem.treefmt.programs.stylua.enable = true;
}
