{ config, pkgs, inputs, ... }:

{
  home.username = "rajkumar";
  home.homeDirectory = "/home/rajkumar";

  home.stateVersion = "26.05";

  home.sessionVariables = {
    ZED_ALLOW_EMULATED_GPU="1";
  };
  home.packages = with pkgs; [
    firefox
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

  programs.neovim = {
  enable = true;

  plugins = with pkgs.vimPlugins; [
     image-nvim
     astrotheme
     rainbow-delimiters-nvim
     luasnip
     grug-far-nvim
     telescope-nvim
     telescope-sg
     telescope-undo-nvim
     glance-nvim
     vim-terminator
     git-blame-nvim
     lsp-colors-nvim
     nvim-lspconfig
     blink-cmp
     friendly-snippets  
     nvim-treesitter
     gitsigns-nvim
     nui-nvim
     neogit
     conjure
     cmp-conjure
     vim-illuminate
     iron-nvim
     treesj
     persistent-breakpoints-nvim
     bufferline-nvim
     git-conflict-nvim
     toggleterm-nvim
     treewalker-nvim
     go-nvim
     snacks-nvim
     trouble-nvim
     which-key-nvim
    ] ++ [
     (pkgs.vimUtils.buildVimPlugin {

       pname = "haskell-tools.nvim";
       version = "unstable";

       src = inputs.haskell-tools;

       dontCheckForLuaModules = true;
       doCheck = false;
    })

    (pkgs.vimUtils.buildVimPlugin {
       pname = "nvim-dap-repl-highlights";
       version = "unstable";

       src = inputs.dap-repl-highlights;

       dontCheckForLuaModules = true;
       doCheck = false;
    })

    (pkgs.vimUtils.buildVimPlugin {
      pname = "nvim-chainsaw";
      version = "unstable";
      src = inputs.chainsaw;
      dontCheckForLuaModules = true;
      doCheck = false;
    })

    (pkgs.vimUtils.buildVimPlugin {
      pname = "windex";
      version = "unstable";
      src = inputs.windex;
    })

    (pkgs.vimUtils.buildVimPlugin {
      pname = "yaml.nvim";
      version = "unstable";
      src =builtins.fetchGit {
        url = "https://tangled.org/cuducos.me/yaml.nvim";
        ref = "main";
     };
    }) 

    

    ];


  };

  xdg.configFile."nvim".source = inputs.nvim-config;
}
