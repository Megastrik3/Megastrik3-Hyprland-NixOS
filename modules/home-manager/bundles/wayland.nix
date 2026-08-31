{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    argyllcms
    brightnessctl
    ddcutil
    grim
    hypridle
    hyprpaper
    mpvpaper
    nwg-displays
    nwg-look
    wl-clipboard
    wlogout
    swappy
    awww
    hyprland-qt-support
  ];
}
