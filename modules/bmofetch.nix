{ config, lib, pkgs, ... }:

let
  # bmofetch fork
  bmofetchGit = builtins.fetchGit {
    url = "https://github.com/Pantonius/bmofetch.git";
    ref = "main";
    rev = "208cfc111e8e2e06001004c4bb07964661ab882c";
  };
in
{
  options = {
    bmofetch.enable = lib.mkEnableOption "enables bmofetch";
  };

  config = lib.mkIf config.bmofetch.enable {
    # add neofetch package
    home.packages = with pkgs; [
      neofetch
    ];

    home.file.".config/neofetch/bmofetch/bmo-quotes.txt".text = ''
      Dodo smells!
      I'm the best!
      There has never been a better time to be a Dodo!
    '';

    # add aliases
    home.shellAliases = {
      bmofetch = "clear && sh ${bmofetchGit}/bmosay.sh -p ~/.config/neofetch/bmofetch -qr ~/.config/neofetch/bmofetch/bmo-quotes.txt && neofetch --config ~/.config/neofetch/bmofetch/bmofetch.conf";
    };
  };
}
