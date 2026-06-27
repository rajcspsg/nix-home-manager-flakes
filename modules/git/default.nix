{
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
}
