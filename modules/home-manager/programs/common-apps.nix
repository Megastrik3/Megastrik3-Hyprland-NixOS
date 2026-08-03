# Standard Home Manager application enables

{ config, pkgs, ... }:

{
  programs = {
    firefox = {
      enable = true;
      configPath = ".mozilla/firefox";
    };
    git.enable = true;
    neovim = {
      enable = true;
      withRuby = false;
      withPython3 = true;
    };
    obsidian.enable = true;
    mpv.enable = true;
    rofi.enable = true;
    vim.enable = true;
    vscode.enable = true;
    waybar.enable = true;
    yt-dlp.enable = true;
    direnv.enable = true;
    emacs.enable = true;
  };
}
