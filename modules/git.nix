{ config, lib, ... }:
{
  options = {
    git.enable = lib.mkEnableOption "enables git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;

      userName = "Anton Pogrebnjak";
      userEmail = "contact@pantonius.dev";

      aliases = {
        "history" = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
      };

      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
