{ config, pkgs, ... }:

{
  home.username = "rajkumar";
  home.homeDirectory = "/home/rajkumar";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    firefox
  ];

  programs.bash.enable = true;
}
