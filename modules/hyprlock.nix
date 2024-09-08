{ config, lib, ... }:
{
  options = {
      hyprlock.enable = lib.mkEnableOption "enables hyprlock";
  };

  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
      	general = {
          	disable_loading_bar = true;
          	hide_cursor = true;
          	no_fade_in = false;
          };
      	background = [{
          	path = "screenshot";
          	blur_passes = 3;
          	blur_size = 8;
          }];	
          input-field = [{
          	size = "400, 50";
          	position = "0, -20";
          	fade_on_empty = false;
          	halign = "center";
          	valign = "center";
          	rounding = 0;
          	font_color = "rgb(dedede)";
          	inner_color = "rgb(121212)";
          	outer_color = "rgb(2df598)";
          	outline_thickness = 2;
          }];
      };
    };
  };
}
