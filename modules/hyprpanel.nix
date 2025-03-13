{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  options = {
    hyprpanel.enable = lib.mkEnableOption "enables hyprpanel";
  };

  config = lib.mkIf config.hyprpanel.enable {
    wayland.windowManager.hyprland = {
      settings.exec-once = [
        "hyprpanel"
      ];
    };

    programs.hyprpanel = {
      enable = true;

      settings = {
        bar.launcher.autoDetectIcon = true;
        bar.workspaces.show_icons = true;

        menus.clock = {
          time = {
            military = true;
          };
          weather.enabled = false;
        };

        menus.dashboard = {
          shortcuts.enabled = false;

          shortcuts.left = {
            shortcut1 = {
              command = "firefox";
              icon = "󰈹";
              tooltip = "Firefox";
            };

            shortcut2 = {
              command = "spotify";
              icon = "󰓇";
              tooltip = "Spotify";
            };
          };
        };
      };
    };

    fonts.fontconfig.enable = true;
    home.packages = [
      (pkgs.nerdfonts.override {
        fonts = [
          "JetBrainsMono"
        ];
      })
    ];
  };
}
