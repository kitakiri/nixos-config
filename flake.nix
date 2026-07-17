{
  description = "Kitakiri's NixOS configuration";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };

  };


  outputs = { self, nixpkgs, home-manager, ... }:

  {

    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {

      system = "x86_64-linux";

      modules = [

        ./hosts/vm/configuration.nix


        home-manager.nixosModules.home-manager


        {

          home-manager = {

            useGlobalPkgs = true;

            useUserPackages = true;

            users.kitakiri = import ./home/home.nix;

          };

        }

      ];

    };

    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {

      system = "x86_64-linux";

      modules = [

        ./hosts/desktop/configuration.nix


        home-manager.nixosModules.home-manager


        {

          home-manager = {

            useGlobalPkgs = true;

            useUserPackages = true;

            users.kitakiri = import ./home/home.nix;

          };

        }

      ];

    };

  };

}
