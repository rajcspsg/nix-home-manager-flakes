{
  description = "NixOS + Home Manager flake with modular Neovim and KDE Plasma config";

  # Input definitions live in path subflakes under flake/inputs/.
  # Nix requires a static attrset here, so nested inputs are re-exported via follows.
  inputs = {
    core.url = "path:./flake/inputs/core";
    neovim.url = "path:./flake/inputs/neovim";

    # core inputs
    nixpkgs.follows = "core/nixpkgs";
    home-manager.follows = "core/home-manager";
    plasma-manager.follows = "core/plasma-manager";
    darkly.follows = "core/darkly";

    # neovim inputs
    nvim-config.follows = "neovim/nvim-config";
    haskell-tools.follows = "neovim/haskell-tools";
    dap-repl-highlights.follows = "neovim/dap-repl-highlights";
    chainsaw.follows = "neovim/chainsaw";
    windex.follows = "neovim/windex";
    nvim-bufterm.follows = "neovim/nvim-bufterm";
    nvim-smoothcursor.follows = "neovim/nvim-smoothcursor";
    nvim-tmux-navigation.follows = "neovim/nvim-tmux-navigation";
    nvim-close-buffers.follows = "neovim/nvim-close-buffers";
    neotest-zig.follows = "neovim/neotest-zig";
    nvim-meow-yarn.follows = "neovim/nvim-meow-yarn";
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
