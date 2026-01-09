{ config, ... }:
{
  flake.modules.nixos.zsh =
    { pkgs, ... }:
    {
      programs.zsh.enable = true;
      environment.pathsToLink = [ "/share/zsh" ];

      users = {
        defaultUserShell = pkgs.zsh;
      };
    };
  flake.modules.homeManager.zsh = hmArgs: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
      dotDir = "${hmArgs.config.home.homeDirectory}/.config/zsh";
      initContent = ''
        # Keybindings
        bindkey -s ^f "tmux-sessionizer\n"
        bindkey -s ^t "tmux attach\n"
        bindkey -s ● "tmux-home\n"

        # Fixes slow git autocompletion
        __git_files () {
          _wanted files expl 'local files' _files
        }

        # Keep history of `cd` as in with `pushd` and make `cd -<TAB>` work.
        setopt auto_pushd
        setopt pushd_ignore_dups
        setopt pushd_minus

        # Nobody need flow control anymore.
        setopt noflowcontrol

        cd . # tmux-sessionizer fix that fixes the current dir not showing in the prompt
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
          "direnv"
        ];
        theme = "robbyrussell";
      };
      sessionVariables = {
        DIRSTACKSIZE = 16;
        HYPHEN_INSENSITIVE = "true";

        EDITOR = config.flake.meta.vic.editor;
        BROWSER = "zen";
        VISUAL = config.flake.meta.vic.editor;
        FILE_PICKER = "thunar";

        # CHANGE THIS FOR DEFAULT WALLPAPER, ALONG WITH $HOME/Ooo/modules/hypr/hyprpaper.conf
        WPDEFAULT = "${hmArgs.config.home.homeDirectory}/personal/Pictures/wallpapers/cats.jpg";

        # GIO_EXTRA_MODULES = "${pkgs.gvfs}/lib/gio/modules"; # potential thunar fix if mounting is bugged
      };
      shellAliases = {
        # Vim
        vim = "nvim";
        vi = "vim";
        svim = "sudo nvim";
        gvim = "vim --listen ~/.cache/nvim/godot.pipe .";

        # ls
        ls = "eza -lh --group-directories-first --icons=auto";
        ll = "ls -a";

        # Git
        g = "git";
        gc = "git commit";
        gs = "git status";
        gaa = "git add --all";

        # Tmux
        t = "tmux";

        # Syncing
        odsync = "onedrive --sync";

        # NixOS
        update = "nix flake update --flake ~/Ooo";
        clean = "nh clean all --keep 10";
        optimise = "sudo nix-store --optimise --verbose"; # If both garbage collecting and optimising, run this after garbage collecting

        # On/off switches
        wifion = "nmcli radio wifi on";
        wifioff = "nmcli radio wifi off";
        ethon = "sudo ifconfig enp2s0 up";
        ethoff = "sudo ifconfig enp2s0 down";
        virshon = "sudo virsh net-start --network default";
        virshoff = "sudo virsh net-destroy --network default";

        # Nice ones
        off = "hyprshutdown -t 'Shutting down...' --post-cmd 'poweroff'";
        reboot = "hyprshutdown -t 'Restarting...' --post-cmd 'reboot'";
        goto = "source";
        open = "xdg-open";
        valias = "${config.flake.meta.vic.editor} ~/Ooo/modules/shell/zsh_USER.nix";
        view = "qimgv";
        ev = "silent evince";
        thu = "silent thunar .";
        R = "R --save --quiet";
        pf = "fd --type f | fzf | xargs ${config.flake.meta.vic.editor}";
        cp = "cp -v";
        mv = "mv -v";
        godot = "godot4 --display-driver wayland";
        vpak = "${config.flake.meta.vic.editor} ~/Ooo/modules/hosts/jake/pkgs.nix";
        screenrec = "wl-screenrec --low-power off --audio";
        screenrec-history = "wl-screenrec --low-power off --audio --history 30 &";
        screenrec-history-get = "killall -USR1 wl-screenrec";
        dontsleep = "systemd-inhibit --what=handle-lid-switch hypridle";
      };
    };
  };
}
