# Neovim plugins sourced from flake inputs or fetchGit.
{ pkgs, inputs }:

[
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
    pname = "bufterm";
    version = "unstable";
    src = inputs.nvim-bufterm;
  })

  (pkgs.vimUtils.buildVimPlugin {
    pname = "SmoothCursor";
    version = "unstable";
    src = inputs.nvim-smoothcursor;
  })

  (pkgs.vimUtils.buildVimPlugin {
    pname = "nvim-tmux-navigation";
    version = "unstable";
    src = inputs.nvim-tmux-navigation;
  })

  (pkgs.vimUtils.buildVimPlugin {
    pname = "close-buffers";
    version = "unstable";
    src = inputs.nvim-close-buffers;
  })

  (pkgs.vimUtils.buildVimPlugin {
    pname = "neotest-zig";
    version = "unstable";
    src = inputs.neotest-zig;
    dontCheckForLuaModules = true;
    doCheck = false;
  })

  (pkgs.vimUtils.buildVimPlugin {
    pname = "meow.yarn.nvim";
    version = "unstable";
    src = inputs.nvim-meow-yarn;
  })

  (pkgs.vimUtils.buildVimPlugin {
    pname = "yaml.nvim";
    version = "unstable";
    src = builtins.fetchGit {
      url = "https://tangled.org/cuducos.me/yaml.nvim";
      ref = "main";
    };
  })

  (pkgs.vimUtils.buildVimPlugin {
    pname = "treesorter.nvim";
    version = "unstable";
    src = builtins.fetchGit {
      url = "https://github.com/maxbol/treesorter.nvim";
    };
  })

  (pkgs.vimUtils.buildVimPlugin {
    pname = "telescope_hoogle";
    version = "unstable";
    src = builtins.fetchGit {
      url = "https://github.com/luc-tielen/telescope_hoogle";
    };
  })

  (pkgs.vimUtils.buildVimPlugin {
    pname = "symbols.nvim";
    version = "unstable";
    src = builtins.fetchGit {
      url = "https://github.com/oskarrrrrrr/symbols.nvim";
      ref = "main";
    };
  })
]
