{ config, pkgs, inputs, ... }:

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
    settings = {
      user = { 
        name = "rajcspsg";

        email = "rajcspsg+@users.noreply.github.com";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      core.editor = "nvim";
    };
  };

  xdg.configFile."nvim".source = inputs.nvim-config;
}
