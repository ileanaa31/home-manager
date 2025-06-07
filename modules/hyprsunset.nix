{ config, lib, ... }:
{
  options = {
    hyprsunset.enable = lib.mkEnableOption "enables hyprsunset";
  };

  config = lib.mkIf config.hyprsunset.enable {
    wayland.windowManager.hyprland = {
      settings.exec-once = [
        "hyprsunset --temperature 2500"
      ];
    };
    services.hyprsunset.enable = true;
  };
}
