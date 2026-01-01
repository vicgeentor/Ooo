{
  flake.modules.homeManager.latex =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        texlive.combined.scheme-full
        ltex-ls-plus
        aspell # Spell checker
        aspellDicts.en
        bibclean # For BibTeX files
      ];
    };
}
