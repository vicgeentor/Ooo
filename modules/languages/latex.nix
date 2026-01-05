{
  flake.modules.nixos.latex =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        texlive.combined.scheme-full
        ltex-ls-plus
        aspell # Spell checker
        aspellDicts.en
        bibclean # For BibTeX files
      ];
    };
}
