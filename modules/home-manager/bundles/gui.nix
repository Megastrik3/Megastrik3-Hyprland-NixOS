{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    baobab
    gnome-system-monitor
    loupe
    xarchiver
    mousepad
    mediawriter
    gnome-boxes
    android-studio-full
    waytrogen
    toast
    totem
    asunder
  ];
}
