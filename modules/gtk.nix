{ config, lib, ... }:
{
  options = {
      gtkTheme.enable = lib.mkEnableOption "enables gtk";
  };

  config = lib.mkIf config.gtkTheme.enable {
    gtk = {
      enable = true;

      # Just so gtk applications know to use the dark theme
      gtk3.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
	'';
      };

      gtk4.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
    };
  };
}
