{ config, pkgs, lib, host ? "", ... }:

{
  home.packages = with pkgs; [
    vesktop
    #planify
    vivaldi
    fortune
    cowsay
    audacity     
    zoom-us 
    antigravity-ide
    openjdk17
    aapt
    usbutils
    czkawka
    zotero
    termius
    darktable
    pear-desktop
    gimp
    prismlauncher
    bitwarden-desktop
    r2modman
    gale
    libreoffice-qt
    hunspellDicts.en_US
    hunspell
    texliveSmall
    uv
    wev
    adwaita-fonts
    cura-appimage
    rpi-imager
    ddcutil
  ] ++ lib.optionals (host != "voyager") [
    davinci-resolve
    gpu-screen-recorder
  ];
}
