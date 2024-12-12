{ config, lib, ... }:
{
  options = {
      hyprcursor.enable = lib.mkEnableOption "enables hyprcursor";
  };

  config = lib.mkIf config.hyprcursor.enable {
    wayland.windowManager.hyprland = {
	enable = true;

	settings = {
	  env = [
	    "HYPRCURSOR_THEME=hypr_Bibata_Modern_Ice"
	  ];
	};
    };

    home.file.".local/share/icons" = {
      source = ./icons;
      recursive = true;
    };
  };
}
