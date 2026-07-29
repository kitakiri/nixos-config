{
  description = "Kitakiri's NixOS configuration";
  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05"; перехожу со stable на unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    plasma-manager,
    nur,
    ...
  }: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/desktop/configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            sharedModules = [
              plasma-manager.homeModules.plasma-manager
            ];

            users.kitakiri = import ./home/home.nix;

            extraSpecialArgs = {
              inherit inputs;
            };
          };
        }
      ];
      specialArgs = {
        inherit inputs;
      };
    };
  };
}
