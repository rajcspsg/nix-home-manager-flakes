{
  description = "Neovim config and plugin inputs";

  inputs = {
    nvim-config = {
      url = "github:rajcspsg/nvim";
      flake = false;
    };
    haskell-tools.url = "github:MrcJkb/haskell-tools.nvim";
    dap-repl-highlights = {
      url = "github:LiadOz/nvim-dap-repl-highlights";
      flake = false;
    };
    chainsaw = {
      url = "github:chrisgrieser/nvim-chainsaw";
      flake = false;
    };
    windex = {
      url = "github:declancm/windex.nvim";
      flake = false;
    };
    nvim-bufterm = {
      url = "github:boltlessengineer/bufterm.nvim";
      flake = false;
    };
    nvim-smoothcursor = {
      url = "github:gen740/SmoothCursor.nvim";
      flake = false;
    };
    nvim-tmux-navigation = {
      url = "github:alexghergh/nvim-tmux-navigation";
      flake = false;
    };
    nvim-close-buffers = {
      url = "github:kazhala/close-buffers.nvim";
      flake = false;
    };
    neotest-zig = {
      url = "github:lawrence-laz/neotest-zig";
      flake = false;
    };
    nvim-meow-yarn = {
      url = "github:retran/meow.yarn.nvim";
      flake = false;
    };
  };

  outputs = _: { };
}
