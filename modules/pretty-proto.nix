{ config, lib, ... }:

let
  # pretty-proto git repo
  prettyGit = builtins.fetchGit {
    url = "https://github.com/Pantonius/pretty-proto.git";
    ref = "main";
    rev = "7d504ed977d9f1e7041fd64b9f0d08b1c4e007cd";
  };
in
{
  options = {
    pretty-proto.enable = lib.mkEnableOption "enables pretty-proto";
  };

  config = lib.mkIf config.pretty-proto.enable {
    # add aliases
    home.shellAliases = {
      "pp" = "sh ${prettyGit}/proto.sh";
    };
  };
}
