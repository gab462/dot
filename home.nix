{ config, pkgs, ... }:

{
  home.username = "me";
  home.homeDirectory = "/home/me";
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    bemenu grimblast wl-clipboard
    font-awesome roboto-mono
    git gh
    mpv imv
    lutris osu-lazer-bin
    gcc
  ];

  programs.bash = {
    enable = true;

    profileExtra = ''
      Hyprland
    '';
  };

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      decoration = {
        rounding = 10;
        drop_shadow = true;
      };

      general = {
        layout = "master";
      };

      input = {
        force_no_accel = true;
        follow_mouse = 1;
        mouse_refocus = false;
        kb_options = ctrl:nocaps;
      };

      "$mod" = "SUPER";

      bind = [
        "$mod, RETURN, exec, foot"
        "$mod, E, exec, emacs"
        "$mod, D, exec, bemenu-run --fn \"Monospace 18\" -H 31"
        "$mod, Q, killactive"
        "$mod, SPACE, layoutmsg, swapwithmaster master"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, Q, exit"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ] ++ (
        builtins.concatLists (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )
          10)
      );

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "wireplumber" "memory" "cpu" "temperature" "clock" ];
        margin-left = 10;
        margin-right = 10;
        margin-top = 10;

        cpu.format = "{usage}% ";

        memory.format = "{}% ";

        temperature = {
          thermal-zone = 1;
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
        };

        wireplumber = {
          format = "{volume}% {icon}";
          format-muted = "";
          format-icons = ["" "" ""];
        };
      };
    };

    style = ''
      #waybar {
        background: rgba(0, 0, 0, 0.5);
        color: white;
        font-family: Roboto Mono Medium;
        font-size: 18pt;
        border-radius: 30px;
      }

      #workspaces button.active {
        color: white;
        background: #333333;
        border-radius: 30px;
      }

      #wireplumber, #memory, #cpu, #temperature, #clock { padding-right: 10px }
    '';
  };

  programs.vim = {
    enable = true;

    settings = {
      copyindent = true;
      background = "dark";
    };

    plugins = [
      pkgs.vimPlugins.vim-fugitive
    ];
  };

  programs.foot = {
    enable = true;

    settings = {
      main.font = "Roboto Mono Medium:size=18";
      colors.alpha = 0.9;
    };
  };

  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture
      obs-pipewire-audio-capture
    ];
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;

    extraPackages = epkgs: with epkgs; [
      gcmh magit
      multiple-cursors avy
      gruvbox-theme
      nix-mode
    ];

    extraConfig = let
      attrString = with builtins; fn: attrs: concatStringsSep " " (attrValues (mapAttrs fn attrs));
      emacsSettings = { setq, setq-default, global-modes, bind, font, alpha, theme }: ''
        (setq ${attrString (name: value: "${name} ${value}") setq})
        (setq-default ${attrString (name: value: "${name} ${value}") setq-default})
        ${attrString (name: value: "(${name}-mode ${value})") global-modes}
        ${attrString (name: value: "(global-set-key (kbd \"${value}\") '${name})") bind}
        (set-frame-parameter nil 'alpha-background ${alpha})
        (set-frame-parameter nil 'font "${font}")
        (load-theme '${theme} t)
        (set-face-attribute 'mode-line nil :box nil)
        (put 'dired-find-alternate-file 'disabled nil)
        (defalias 'yes-or-no-p 'y-or-n-p)
      '';
    in emacsSettings {
      font = "Roboto Mono Medium-18";
      alpha = "90";
      theme = "gruvbox";

      setq = {
        make-backup-files = "nil";
        create-lockfiles = "nil";

        kill-whole-line = "t";
        show-paren-delay = "0";
        ring-bell-function = "'ignore";

        "mc/always-run-for-all" = "t";
      };

      setq-default = {
        tab-always-indent = "'complete";
        indent-tabs-mode = "nil";
      };

      global-modes = {
        electric-pair = "t";
        delete-selection = "t";
        show-paren = "t";
        gcmh = "t";
        tool-bar = "-1";
        scroll-bar = "-1";
        menu-bar = "-1";
      };

      bind = {
        hippie-expand = "M-/";
        kill-this-buffer = "C-x k";
        raise-sexp = "M-*";
        mark-sexp = "C-=";

        avy-goto-word-1 = "C-;";
        avy-goto-char-timer = "C-'";

        "mc/mark-next-like-this" = "C-.";
        "mc/skip-to-next-like-this" = "C-,";
      };
    };
  };
}
