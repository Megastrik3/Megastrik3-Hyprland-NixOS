{ config, pkgs, ... }:

let
  catppuccin-kv = pkgs.catppuccin-kvantum.override {
    accent = "blue";
    variant = "mocha";
  };
in {
  home.packages = with pkgs; [
    catppuccin-kv
    libsForQt5.qt5ct
    kdePackages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
  ];

  # Manually link the theme into the Kvantum config folder
  xdg.configFile."Kvantum/catppuccin-mocha-blue".source = 
    "${catppuccin-kv}/share/Kvantum/catppuccin-mocha-blue";

  # Force Kvantum to use this theme by default
  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=catppuccin-mocha-blue
  '';

  # Ensure QT_STYLE_OVERRIDE is unset so qt6ct and qt5ct function correctly
  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    # Note: Do NOT set style.name here. Setting style.name forces QT_STYLE_OVERRIDE,
    # which bypasses qt6ct / qt5ct styling plugins.
  };
}