{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vesktop
    #planify
    vivaldi
    fortune
    cowsay
    audacity     
    zoom-us 
    antigravity
    openjdk17
    aapt
    usbutils
    czkawka
    zotero
    termius
    darktable
    davinci-resolve
    pear-desktop
    gimp
    prismlauncher
    bitwarden-desktop
    r2modman
    #libreoffice-qt
    hunspell
    texliveSmall
    gpu-screen-recorder
    uv
    wev
    adwaita-fonts
    cura-appimage
    rpi-imager
    ddcutil
  ];
}
