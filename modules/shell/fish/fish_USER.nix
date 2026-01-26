{ config, ... }:
{
  flake.modules.nixos.fish =
    { pkgs, ... }:
    {
      programs.fish.enable = true;

      programs.bash = {
        interactiveShellInit = ''
          if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
          then
            shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
            exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
          fi
        '';
      };
    };

  flake.modules.homeManager.fish =
    hmArgs@{ pkgs, ... }:
    {
      programs = {
        tmux.shell = "${pkgs.fish}/bin/fish";
        ghostty.enableFishIntegration = true;
        zoxide.enableFishIntegration = true;
        direnv.enableFishIntegration = true;
        nix-index.enableFishIntegration = false;
      };

      home.file = {
        ".config/fish/functions/fish_prompt.fish".source =
          hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/shell/fish/fish_prompt.fish";
      };

      programs.fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting # Disable greeting

          function fish_greeting
            # fortune | cowsay | sed 's/^/    /'
          end
        '';
        binds = {
          "ctrl-f" = {
            command = "tmux-sessionizer";
            repaint = true;
            silent = true;
          };
          "ctrl-t" = {
            command = "tmux attach";
            repaint = true;
            silent = true;
          };
          "●" = {
            command = "tmux-home";
            repaint = true;
            silent = true;
          };
          "ctrl-y" = {
            command = "accept-autosuggestion";
            operate = "preset";
          };
          "alt-s" = {
            erase = true;
            operate = "preset";
          };
        };
        shellAliases = {
          cp = "cp -v";
          mv = "mv -v";
          ls = "eza -lh --group-directories-first --icons=auto";
          ll = "ls -a";
          R = "R --save --quiet";
        };
        shellAbbrs = {
          vim = "nvim";
          vi = "nvim";
          svim = "sudo nvim";
          gvim = "nvim --listen ~/.cache/nvim/godot.pipe .";

          # Git
          g = "git";
          gc = "git commit";
          gs = "git status";
          gaa = "git add --all";
          gp = "git push";

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
          valias = "${config.flake.meta.vic.editor} ~/Ooo/modules/shell/fish/fish_USER.nix";
          view = "qimgv";
          ev = "silent evince";
          thu = "silent thunar .";
          pf = "fd --type f | fzf | xargs ${config.flake.meta.vic.editor}";
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
