{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bc
    duf
    findutils
    killall
    pciutils
    wget
    inxi
    jq
    unzip
    yad
    python312
    tmux
    zip
    antigravity-cli
  ];
}
