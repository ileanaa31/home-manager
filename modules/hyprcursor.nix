{ config, lib, ... }:
{
  options = {
      hyprcursor.enable = lib.mkEnableOption "enables hyprcursor";
  };

  config = lib.mkIf config.hyprcursor.enable {
    wayland.windowManager.hyprland = {
	enable = true;

	settings = {
	  env = lib.mkDefault [
	    "HYPRCURSOR_THEME=Bibata-Modern-Ice"
	    "XCURSOR_THEME=Bibata-Modern-Ice"
	  ];
	};
    };

    # dconf settings
    dconf.settings = {
      "org/gnome/desktop/interface" = { 
	cursor-theme = lib.mkDefault "Bibata-Modern-Ice";
      };
    };


    home.file.".local/share/icons" = {
      source = ./.icons;
      recursive = true;
    };
  };
}
