{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ffmpeg
    cava
    imagemagick
    pamixer
    pavucontrol
    playerctl
    gpu-screen-recorder-gtk
    cliphist
    slurp
  ];
}
