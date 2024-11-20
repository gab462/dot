# vim: et:sw=2:sts=2
{ config, pkgs, ... }:

{
  home = {
    stateVersion = "23.11";
    username = "me";
    homeDirectory = "/home/me";

    packages = with pkgs; [
      bemenu grimblast wl-clipboard
      font-awesome roboto-mono
      git gh
      mpv imv
      lutris osu-lazer-bin
      gawk jq hexdump # pipewire-screenaudio
    ];
  };

  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;

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
        "$mod, S, exec, grimblast copy area"
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

  programs = {
    home-manager.enable = true;

    bash = {
      enable = true;

      profileExtra = ''
        [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] && Hyprland
        '';
    };

    waybar = {
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

    foot = {
      enable = true;

      settings = {
        main.font = "Roboto Mono Medium:size=18";

        colors = {
          alpha = 0.9;
          background = "282828";
          foreground = "ebdbb2";
          regular0 = "282828";
          regular1 = "cc241d";
          regular2 = "98971a";
          regular3 = "d79921";
          regular4 = "458588";
          regular5 = "b16286";
          regular6 = "689d6a";
          regular7 = "a89984";
          bright0 = "928374";
          bright1 = "fb4934";
          bright2 = "b8bb26";
          bright3 = "fabd2f";
          bright4 = "83a598";
          bright5 = "d3869b";
          bright6 = "8ec07c";
          bright7 = "ebdbb2";
        };
      };
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraLuaConfig = builtins.readFile ./neovim.lua;

      plugins = with pkgs.vimPlugins; [
        gruvbox-nvim nvim-treesitter.withAllGrammars
      ];
    };

    emacs = {
      enable = true;
      package = pkgs.emacs29-pgtk;
      extraConfig = builtins.readFile ./emacs.el;

      extraPackages = epkgs: with epkgs; [
        gcmh magit
          multiple-cursors avy
          gruvbox-theme
          nix-mode
      ];
    };

    obs-studio = {
      enable = true;

      plugins = with pkgs.obs-studio-plugins; [
        obs-vkcapture
          obs-pipewire-audio-capture
      ];
    };
  };
}
