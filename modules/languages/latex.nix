{
  flake.modules.nixos.latex =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        texliveFull
        ltex-ls-plus
        aspell # Spell checker
        aspellDicts.en
        bibclean # For BibTeX files
      ];
    };
}
