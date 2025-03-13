{ lib, config, ... }:
{
  options = {
    kitty.enable = lib.mkEnableOption "enables kitty";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      font = lib.mkForce {
        name = "Fira Code";
        size = 12;
      };

      keybindings = {
        "ctrl+shift+t" = "new_tab";
        "ctrl+shift+q" = "close_tab";
      };
    };
  };
}
