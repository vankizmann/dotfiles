{
    description = "vankizmann flakes";

    inputs = {

        nixpkgs = {
            url = "nixpkgs/nixos-24.11";
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: {
        nixosConfigurations.nixmann = inputs.nixpkgs.lib.nixosSystem {

            system = "x86_64-linux";

            specialArgs = {
                inherit inputs;
            };

            modules = [
                ./nixos/configuration.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.kizmann = import ./home/home.nix ;
                }
            ];

        };
    };

}
