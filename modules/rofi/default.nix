{
  flake.modules.homeManager.rofi = hmArgs: {
    programs.rofi = {
      enable = true;
      theme = "${hmArgs.config.home.homeDirectory}/Ooo/modules/rofi/default.rasi";
    };
  };
}
