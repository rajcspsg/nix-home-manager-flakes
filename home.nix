{ config, pkgs, ... }:

{
  home.username = "rajkumar";
  home.homeDirectory = "/home/rajkumar";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    firefox
  ];

  programs.bash.enable = true;

  programs.git = {
    enable = true;

    userName = "rajcspsg";

    userEmail = "rajcspsg+YOUR_USERNAME@users.noreply.github.com";

    extraConfig = {
     init.defaultBranch = "main";
     push.autoSetupRemote = true;
     core.editor = "nvim";
  };
};
}
