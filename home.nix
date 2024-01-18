{ config, pkgs, ... }:

{
  home.username = "me";
  home.homeDirectory = "/home/me";

  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.bemenu
    pkgs.osu-lazer-bin
    pkgs.grimblast
    pkgs.wl-clipboard
    pkgs.git
    pkgs.gh
    pkgs.protontricks
    pkgs.unzip
    pkgs.mpv
    pkgs.imv
    pkgs.font-awesome
    pkgs.lutris
  ];

  programs.bash = {
    enable = true;
    profileExtra = ''
      Hyprland
    '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      decoration = {
        rounding = 10;
        drop_shadow = true;
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
        "$mod, D, exec, bemenu-run --fn \"Monospace 18\" -H 31"
        "$mod, Q, killactive"
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

        cpu = {
          format = "{usage}% ";
        };

        memory = {
          format = "{}% ";
        };

        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
        };

        wireplumber = {
          format = "{volume}% {icon}";
          format-muted = "";
          format-icons = ["" "" ""];
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-size: 18pt;
      }

      #workspaces button, window#waybar {
        padding: 0 5px;
        background: #1d1f21;
        color: white;
      }

      #workspaces button.active {
          background: #333333;
          border-bottom: 2px solid #327bd1;
      }

      #wireplumber, #memory, #cpu, #temperature, #clock { padding-right: 10px }
    '';
  };

  programs.vim = {
    enable = true;

    settings = {
      expandtab = true;
      shiftwidth = 2;
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
      main = {
        font = "Monospace:size=18";
      };

      colors = {
        alpha = 0.9;
      };
    };
  };

  programs.obs-studio = {
    enable = true;

    plugins = [
      pkgs.obs-studio-plugins.obs-vkcapture
    ];
  };
}
