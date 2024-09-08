{
  description = "Anton's entire existance as a flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
        url = "github:nix-community/nixvim/nixos-24.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    homeConfigurations = {
      "anton" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
	  system = "x86_64-linux";
	  config = {
	    allowUnfree = true;
	  };
	};
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home.nix
          ./modules
	  inputs.nixvim.homeManagerModules.nixvim
        ];
      };
    };
  };
}
