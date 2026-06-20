{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    darkly.url = "github:Bali10050/Darkly";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nvim-config = {
      url = "github:rajcspsg/nvim";
      flake = false;
    };
    haskell-tools.url = "github:MrcJkb/haskell-tools.nvim";
    dap-repl-highlights = {
      url = "github:LiadOz/nvim-dap-repl-highlights";
      flake = false;
    };
    chainsaw = {
      url = "github:chrisgrieser/nvim-chainsaw";
      flake = false;
    };
    windex = {
      url = "github:declancm/windex.nvim";
      flake = false;
    };
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
