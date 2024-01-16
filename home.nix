{ config, pkgs, ... }:

{
  home.username = "me";
  home.homeDirectory = "/home/me";

  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = [
    pkgs.bemenu
    pkgs.osu-lazer-bin
    pkgs.grimblast
    pkgs.wl-clipboard
    pkgs.git
    pkgs.gh
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
        kb_options = ctrl:nocaps;
      };

      "$mod" = "SUPER";

      bind = [
        "$mod, RETURN, exec, foot"
        "$mod, D, exec, bemenu-run"
        "$mod, Q, killactive"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"
        "$mod SHIFT, Q, exit"
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
        modules-right = [ "wireplumber" "network" "memory" "cpu" "temperature" "simpleclock" ];
      };
    };
  };

  programs.vim = {
    enable = true;
    settings = {
      expandtab = true;
      shiftwidth = 2;
      background = "dark";
    };
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
}
