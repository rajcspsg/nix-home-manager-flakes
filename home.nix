{
  config,
  pkgs,
  inputs,
  ...
}:

let
  macTahoeTheme = pkgs.stdenvNoCC.mkDerivation {
    pname = "mactahoe-gtk-theme";
    version = "master";

    src = pkgs.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "MacTahoe-gtk-theme";
      rev = "master";
      hash = "sha256-/XTUUq5Uyuxgr0cZTmkUmj2/NrM1GEZ7pgrnlqKI6K0=";
    };

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/themes

      # Install GTK themes directly from source (no installer)
      cp -r src/* $out/share/themes/
    '';
  };
  mactahoe-icons = pkgs.stdenvNoCC.mkDerivation {
    pname = "mactahoe-icon-theme";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "MacTahoe-icon-theme";
      rev = "main";
      sha256 = "sha256-YCtpagkXhRwD9NJRvgskq7yf4qr4XqUxQYUfyKD7mUs=";
    };

    installPhase = ''
      mkdir -p $out/share/icons
      cp -r src/* $out/share/icons/

    '';
  };
  mactahoe-cursors = pkgs.stdenvNoCC.mkDerivation {
    pname = "mactahoe-cursors";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "MacTahoe-icon-theme";
      rev = "main";
      sha256 = "sha256-YCtpagkXhRwD9NJRvgskq7yf4qr4XqUxQYUfyKD7mUs=";
    };

    installPhase = ''
      mkdir -p $out/share/icons/MacTahoe
      cp -r cursors/* $out/share/icons/MacTahoe/
    '';
  };
in
{
  home.username = "rajkumar";
  home.homeDirectory = "/home/rajkumar";

  home.stateVersion = "26.11";

  home.sessionVariables = {
    ZED_ALLOW_EMULATED_GPU = "1";
  };
  home.packages = with pkgs; [
    bash
    sassc
    macTahoeTheme
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
    macTahoeTheme
    mactahoe-icons
    mactahoe-cursors
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

    plugins =
      with pkgs.vimPlugins;
      [
        image-nvim
        astrotheme
        rainbow-delimiters-nvim
        luasnip
        grug-far-nvim
        telescope-nvim
        telescope-sg
        telescope-undo-nvim
        telescope-hierarchy-nvim
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
        nvim-parinfer
        vim-sexp
        vim-sexp-mappings-for-regular-people
        mason-nvim-dap-nvim
        nvim-dap-rr
        nvim-hlslens
        nvim-lightbulb
        nvim-dap-go
        gitsigns-nvim
        lsp-inlayhints-nvim
        neotest-vitest
        tssorter-nvim
        nvim-dap
        nvim-dap-python
        nvim-dap-virtual-text
        nvim-jdtls
        neotest-haskell
        nvim-jdtls
        lsp-status-nvim
        plenary-nvim
        lualine-nvim
        neo-tree-nvim
        neotest
        neotest-go
        neotest-jest
        neotest-playwright
        nvim-nio
        telescope-fzf-native-nvim
        telescope-symbols-nvim
        telescope-ui-select-nvim
        nvim-web-devicons
        lspsaga-nvim
        none-ls-nvim
        lspkind-nvim
        typescript-tools-nvim
        tiny-glimmer-nvim
        vim-dispatch
        vim-dispatch-neovim
        nvim-dap-ui
        neotest-java
        crates-nvim
        nvim-metals
        diffview-nvim
        smear-cursor-nvim
        conform-nvim
        overseer-nvim
        vim-floaterm
        mason-lspconfig-nvim
        mason-nvim
        nvim-autopairs
        nvim-ts-autotag
        pretty-fold-nvim
        fold-preview-nvim
        nvim-vtsls
        nvim-treesitter-context
      ]
      ++ [
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

      ];

  };

  xdg.configFile."nvim".source = inputs.nvim-config;

  programs.plasma = {
    enable = true;

    kwin = {
      effects = {
        blur.enable = true;
      };
    };
  };
  # home.file.".gtkrc-2.0".force = true;
  xdg.configFile."gtk-3.0/settings.ini".force = true;
  xdg.configFile."gtk-4.0/settings.ini".force = true;
  xdg.configFile."kdeglobals".force = true;
  xdg.configFile."kdeglobals".text = ''
    [Icons]
    Theme=MacTahoe
    [Cursor]
    Theme=MacTahoe
    Size=24
  '';

  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
  ];

  home.pointerCursor = {
    package = mactahoe-cursors;

    name = "MacTahoe";
    size = 24;

    gtk.enable = true;
    x11.enable = true;
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
  };
  gtk = {
    enable = true;

    theme = {
      name = "MacTahoe-Dark";
      package = macTahoeTheme;
    };

    iconTheme = {
      name = "MacTahoe";
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}
