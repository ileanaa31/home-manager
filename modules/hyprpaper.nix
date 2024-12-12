{ config, lib, ... }:
{
  options = {
      hyprpaper.enable = lib.mkEnableOption "enables hyprpaper";
  };

  config = lib.mkIf config.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
	preload = [
	  "~/.config/home-manager/modules/hyprpaper/wallpaper.png"
	];
	wallpaper = [
	  ", ~/.config/home-manager/modules/hyprpaper/wallpaper.png"
	];
      };
    };
  };
}
