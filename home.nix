{ ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "anton";
  home.homeDirectory = "/home/anton";

  # Shells
  programs.bash.enable = true;

  # Some modules of my own
  bmofetch.enable = true;
  dunst.enable = true;
  gtkTheme.enable = true;
  hyprland.enable = true;
  hyprlock.enable = true;
  hyprcursor.enable = true;
  # hyprgrass.enable = true;
  hyprpaper.enable = true;
  nixvim.enable = true;
  pretty-proto.enable = true;
  rofi.enable = true;
  stylix-theme.enable = true;
  waybar.enable = true;

  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
