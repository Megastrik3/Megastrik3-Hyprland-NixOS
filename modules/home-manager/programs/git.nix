{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      include.path = "~/.gitconfig.local";
      credential.helper = "${pkgs.gh}/bin/gh auth git-credential";
    };
  };
}
