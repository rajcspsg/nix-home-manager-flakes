run the below command in the project root -

```zsh
sudo nix flake update ; sudo nixos-rebuild switch --impure --show-trace --flake .
```
