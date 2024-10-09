{ pkgs, config, lib, inputs, ... }:
{
  	options = {
      		hyprgrass.enable = lib.mkEnableOption "enables hyprgrass";
  	};

	config = lib.mkIf config.hyprgrass.enable {
		wayland.windowManager.hyprland = {
			enable = true;
			
			plugins = [
			  inputs.hyprgrass.packages.${pkgs.system}.default
			];
		};
	};
}
