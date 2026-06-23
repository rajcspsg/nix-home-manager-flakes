{
  description = "NixOS + Home Manager flake with modular Neovim and KDE Plasma config";

  # Nix requires inputs here to be a static attribute set (no import/let).
  # Input definitions live in path subflakes under flake/inputs/ and are
  # flattened in outputs via flake/lib.nix.
  inputs = {
    core.url = "path:./flake/inputs/core";
    neovim.url = "path:./flake/inputs/neovim";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          { nixpkgs.hostPlatform = "x86_64-linux"; }
          /etc/nixos/configuration.nix
          home-manager.nixosModules.default

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.rajkumar = import ./home.nix;
          }
        ];
      };
    };
}
