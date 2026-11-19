{ config, pkgs, lib, host ? "", ... }:

{
  home.packages = with pkgs; [
    ffmpeg
    cava
    imagemagick
    pamixer
    pavucontrol
    playerctl
    cliphist
    slurp
  ] ++ lib.optionals (host != "voyager") [
    gpu-screen-recorder-gtk
  ];
}
