{ config, lib, ... }:
{
  options = {
      stylix-theme.enable = lib.mkEnableOption "enables stylix";
  };

  config = lib.mkIf config.stylix-theme.enable {
    stylix = {
      enable = true;
      image = hyprpaper/wallpaper.png;
      base16Scheme = {
	system = "base16";
	name = "Panto";
	author = "Anton Pogrebnjak";
	variant = "dark";
	palette = {
	  base00 = "#121212";
	  base01 = "#212121";
  	  base02 = "#424242";
  	  base03 = "#757575";
  	  base04 = "#B0B0B0";
  	  base05 = "#C8E1F8";
  	  base06 = "#E0E0E0";
  	  base07 = "#8F98A0";
	  base08 = "#ff5370";
	  base09 = "#f67f81";
	  base0A = "#ffc777";
	  base0B = "#2df4c0";
  	  base0C = "#04d1f9";
	  base0D = "#2df598";
  	  base0E = "#b994f1";
  	  base0F = "#ecb2f0";
	};
      };

      targets = {
	rofi.enable = false;
      };
    };
  };
}
