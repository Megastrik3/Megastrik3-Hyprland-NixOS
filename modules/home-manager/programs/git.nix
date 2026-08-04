{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      include.path = "~/.gitconfig.local";
    };
  };
}
