{
  description = "Kitakiri's NixOS configuration";
  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05"; перехожу со stable на unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      # url = "github:nix-community/home-manager/release-26.05";
      # # тут тоже надо перейти на unstable со stable
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

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      # разрабы не рекомендуют следовать кэшу nixpkgs
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    # niri = {
    #   url = "github:sodiboo/niri-flake";
    #   # inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    plasma-manager,
    nur,
    ...
  }: let
    mkHost = { hostname, username }:
    let
      myModules = ./modules;
      myHome = ./home;
    in
    nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./hosts/${hostname}/configuration.nix
        home-manager.nixosModules.home-manager
        inputs.noctalia-greeter.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            sharedModules = [
              plasma-manager.homeModules.plasma-manager
              inputs.noctalia.homeModules.default
              # inputs.niri.homeModules.niri
              # {
              #   # явно берём готовый niri-unstable из собственной
              #   # сборки niri-flake, а не из общего useGlobalPkgs pkgs
              #   programs.niri.package = inputs.niri.packages.x86_64-linux.niri-unstable;
              # }
            ];

            users.${username} = ./hosts/${hostname}/home.nix;

            extraSpecialArgs = {
              inherit self inputs username hostname myHome;
            };
          };
        }
      ];
      specialArgs = {
        inherit self inputs username hostname myModules;
      };
    };
  in {
    nixosConfigurations.desktop = mkHost {
      hostname = "desktop";
      username = "kitakiri";
    };
  };
}
