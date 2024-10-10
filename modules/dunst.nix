{ lib, config, ... }:
{
  options = {
      dunst.enable = lib.mkEnableOption "enables dunst";
  };

  config = lib.mkIf config.dunst.enable {
    services.dunst = {
      enable = true;

      settings = {
	global = {
	  width = 300;
      	  height = 300;
      	  offset = "30x50";
      	  origin = "top-right";
      	  transparency = 10;
      	  frame_color = "#2df598";
      	  font = "Ubuntu";
      	};
    
      	urgency_normal = {
      	  background = "#212121";
      	  foreground = "#ffffff";
      	  timeout = 10;
      	};
      };
    };
  };
}
