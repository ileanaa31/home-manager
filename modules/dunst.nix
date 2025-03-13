{ lib, config, ... }:
{
  options = {
    dunst.enable = lib.mkEnableOption "enables dunst";
  };

  config = lib.mkIf config.dunst.enable {
    wayland.windowManager.hyprland.settings.exec-once = [
      "dunst &"
    ];

    services.dunst = {
      enable = true;

      settings = {
        global = {
          width = 300;
          height = 300;
          offset = "30x30";
          origin = "top-right";
          transparency = 10;
          frame_color = lib.mkDefault "#2df598";
          frame_width = 2;
          min_icon_size = 16;
          max_icon_size = 64;
          font = lib.mkForce "Ubuntu 10";
          dmenu = "rofi -dmenu -i -p dunst";
          mouse_left_click = "do_action";
          mouse_middle_click = "close_current";
          mouse_right_click = "close_all";
        };

        urgency_normal = {
          background = lib.mkDefault "#121212";
          foreground = lib.mkDefault "#dddddd";
          timeout = 10;
        };
      };
    };
  };
}
