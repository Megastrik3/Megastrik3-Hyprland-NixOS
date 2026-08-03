{ config, pkgs, ... }: {
  xdg.configFile."quickshell".source = ./quickshell;
}
