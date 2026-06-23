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
    { self, ... }@inputs:
    import ./flake/nixos.nix (import ./flake/lib.nix inputs);
}
