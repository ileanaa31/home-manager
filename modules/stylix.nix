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
          base00 = "#121212"; # default background
          base01 = "#212121"; # light background
          base02 = "#424242"; # selection background
          base03 = "#757575"; # comments, invisibles, line highlighting
          base04 = "#B0B0B0"; # dark foreground
          base05 = "#C8E1F8"; # default foreground, caret, delimiters, operators
          base06 = "#E0E0E0"; # light foreground (rare)
          base07 = "#8F98A0"; # light background (rare)
          base08 = "#FD5253"; # variables, xml tags, markup link text, markup lists, diff deleted
          base09 = "#2DF598"; # integers, boolean, constant, xml attributes, markup link url
          #base0A = "#62D7E8"; # classes, markup bold, search text background
          base0A = "#0ef0f0";
          base0B = "#AF87D7"; # strings, inherited class, markup code, diff inserted
          base0C = "#A1EFE4"; # support, regular expressions, escape characters, markup quotes
          base0D = "#2DF598"; # functions, methods, attribute ids, headings
          base0E = "#ffcc1b"; # keywords, storage, selector, markup italic, diff changed
          base0F = "#A16946"; # deprecated, opening/closing embedded language tags
        };
      };

      targets = {
        rofi.enable = false;
      };
    };
  };
}
