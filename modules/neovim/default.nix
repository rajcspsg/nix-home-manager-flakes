{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    tree-sitter
    nixd
    nil
    rust-analyzer
    lua-language-server
    gopls
    jdt-language-server
    metals
    clojure-lsp
    vtsls
    dhall-lsp-server
    delve
  ];

  programs.neovim = {
    enable = true;
    plugins = import ./plugins.nix { inherit pkgs inputs; };
  };

  xdg.configFile."nvim".source = inputs.nvim-config;
}
