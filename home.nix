{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "anton";
  home.homeDirectory = "/home/anton";

  # Shells
  programs.bash.enable = true;

  # Some modules of my own
  bmofetch.enable = true;
  gtkTheme.enable = true;
  hyprland.enable = true;
  hyprlock.enable = true;
  # hyprgrass.enable = true;
  nixvim.enable = true;
  pretty-proto.enable = true;
  rofi.enable = true;

  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
