{ config, lib, ... }:
{
  options = {
    waybar.enable = lib.mkEnableOption "enables waybar";
  };

  config = lib.mkIf config.waybar.enable {
    wayland.windowManager.hyprland.settings.exec-once = [
      "waybar"
    ];

    programs.waybar = {
      enable = true;

      settings = {
        mainBar = {
          layer = "top";
          position = "top";

          height = 30;

          modules-left = [
            "hyprland/workspaces"
          ];

          modules-center = [
            "hyprland/window"
          ];

          modules-right = [
            "pulseaudio"
            "network"
            "cpu"
            "memory"
            "battery"
            "clock"
            "tray"
          ];

          "hyprland/workspaces" = {
            disable-scroll = true;
            on-click = "activate";
            all-outputs = true;
            format = " {id} ";
            sort-by = "id";
          };

          "clock" = {
            format = "{:%H:%M}";
            on-click = "firefox --new-tab https://calendar.proton.me";
            tooltip-format = "{calendar}";
            calendar = {
              format = {
                today = "<span background='#${config.lib.stylix.colors.base0D}' color='#${config.lib.stylix.colors.base00}'><b>{}</b></span>";
              };
            };
          };

          "tray" = {
            spacing = 10;
          };

          "pulseaudio" = {
            format = "{icon} {volume:2}%";
            format-bluetooth = "{icon}  {volume}%";
            format-muted = "Muted";
            format-icons = {
              headphones = "  ";
              default = [
                "  "
              ];
            };
          };

          "network" = {
            format-wifi = "   {signalStrength}%";
            format-ethernet = "{ipaddr}/{cidr} 󰈀 ";
            format-disconnected = "DISCONNECTED";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
            tooltip-format = "{ifname}: {ipaddr}/{cidr}";
          };

          "memory" = {
            interval = 5;
            format = "RAM {}%";
          };

          "cpu" = {
            interval = 5;
            format = "CPU {}%";
          };

          "battery" = {
            states = {
              good = 95;
              warning = 30;
              critical = 15;
            };
            format = "{icon}  {capacity}%";
            format-icons = [
              " "
              " "
              " "
              " "
              " "
            ];
          };
        };
      };

      style = ''
                * {
                  font-size: 16px;
                  font-family: "Ubuntu", monospace;
                  font-weight: bold;
        	  margin: 0;
        	  padding: 0;
                }

                window#waybar {
        	  background: #${config.lib.stylix.colors.base01};
        	  border-radius: 0 0 8px 8px;
        	  color: #${config.lib.stylix.colors.base05};
                }

                #workspaces button {
        	  padding: 0 2px;
        	  color: #${config.lib.stylix.colors.base05};
                }

                #workspaces button.active {
        	  color: #${config.lib.stylix.colors.base0D};
                }

                #clock,
                #network,
                #pulseaudio,
                #memory,
                #cpu,
                #battery,
        	#tray {
        	  padding: 0 10px;
        	  color: #${config.lib.stylix.colors.base05};
                }
      '';
    };
  };
}
