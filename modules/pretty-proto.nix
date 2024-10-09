{ config, lib, ... }:

let
  # pretty-proto git repo
  prettyGit = builtins.fetchGit {
    url = "https://github.com/Pantonius/pretty-proto.git";
    ref = "main";
    rev = "b2e7cb853b33ff7ad26b5081a8c047682fcb697e";
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
