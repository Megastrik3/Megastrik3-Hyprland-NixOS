{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
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
