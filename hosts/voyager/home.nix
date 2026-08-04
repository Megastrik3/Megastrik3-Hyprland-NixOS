{ config, pkgs, inputs, username, ... }:

{
  imports = [
    ../../modules/home-manager/programs/common-apps.nix
    ../../modules/home-manager/programs/git.nix
    ../../modules/home-manager/programs/kitty.nix
    ../../modules/home-manager/programs/btop.nix
    ../../modules/home-manager/programs/obs-studio.nix
    ../../modules/home-manager/programs/fastfetch.nix
    ../../modules/home-manager/programs/gtk.nix
    ../../modules/home-manager/programs/noctalia.nix
    ../../modules/home-manager/programs/cava-config.nix
    ../../modules/home-manager/programs/hypr-settings.nix
    ../../modules/home-manager/programs/hypr-windowrules.nix
    ../../modules/home-manager/programs/hypr-keybinds.nix
    ../../modules/home-manager/programs/hypr-startup.nix
    ../../modules/home-manager/programs/quickshell-config.nix
    ../../modules/home-manager/programs/swappy-config.nix
    ../../modules/home-manager/programs/rofi-config.nix
    ../../modules/home-manager/bundles/general.nix
    ../../modules/home-manager/bundles/cli.nix
    ../../modules/home-manager/bundles/gui.nix
    ../../modules/home-manager/bundles/media.nix
    ../../modules/home-manager/bundles/wayland.nix
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = true;
  };

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
