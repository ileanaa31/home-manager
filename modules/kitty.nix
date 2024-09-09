{ lib, config, ... }:
{
  options = {
    kitty.enable = lib.mkEnableOption "enables kitty";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      font = {
	name = "Fira Code";
	size = 12;
      };

      theme = "3024 Night";
      keybindings = {
	"ctrl+shift+t" = "new_tab";
	"ctrl+shift+q" = "close_tab";
      };
    };
  };
}
