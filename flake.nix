{
  description = "Rudra flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixCats = {
    #   url = "path:/home/rick/system1/modules/nixCats";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/default/configuration.nix
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.default
        # ({ pkgs, ... }: {
        #   environment.systemPackages = [
        #     nixCats.packages.${pkgs.system}.nixCats
        #   ];
        # })
      ];
    };
  };
}
