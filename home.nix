{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.username = "rajkumar";
  home.homeDirectory = "/home/rajkumar";
  home.stateVersion = "26.11";

  home.sessionVariables = {
    ZED_ALLOW_EMULATED_GPU = "1";
  };

  home.packages = with pkgs; [
    bash
    firefox
  ];

  programs.bash.enable = true;

  imports = [
    ./modules/git
    ./modules/neovim
    ./modules/plasma
  ];
}
