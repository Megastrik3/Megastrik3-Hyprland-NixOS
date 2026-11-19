{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = true;
    withNodeJs = true;

    extraPackages = with pkgs; [
      # Core development & compilation tools for LazyVim / Treesitter
      git
      gcc
      gnumake
      unzip
      curl
      ripgrep
      fd
      lazygit
      tree-sitter

      # Language Servers, Linters & Formatters
      pyright
      ruff
      lua-language-server
      stylua
    ];

    initLua = ''
      require("config.lazy")
    '';
  };

  xdg.configFile."nvim/lua" = {
    source = ./neovim/lua;
    recursive = true;
  };
}
