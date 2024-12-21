{ config, lib, ... }:

let
  # pretty-proto git repo
  prettyGit = builtins.fetchGit {
    url = "https://github.com/Pantonius/pretty-proto.git";
    ref = "main";
    rev = "2d94294ea52e042424938735a3e6d58bf9b915cb";
  };
in
{
  options = {
    pretty-proto.enable = lib.mkEnableOption "enables pretty-proto";
  };

  config = lib.mkIf config.pretty-proto.enable {
    # add aliases
    home.shellAliases = {
      pretty = "sh ${prettyGit}/proto.sh";
    };
  };
}
