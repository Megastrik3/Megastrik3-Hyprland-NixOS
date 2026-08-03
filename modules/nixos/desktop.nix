# Desktop Environment & GUI programs baseline module

{ pkgs, inputs, ... }:

let
  python-packages = pkgs.python312.withPackages (
    ps: with ps; [
      requests
      pyquery
    ]
  );
in
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.android_sdk.accept_license = true;

  # Fonts Configuration
  fonts = {
    packages = with pkgs; [
      fira-code
      jetbrains-mono
      font-awesome
      terminus_font
      victor-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.fantasque-sans-mono
    ];
  };

  # Hyprland Desktop Environment System Options
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };

    gpu-screen-recorder.enable = true;
    nix-ld.enable = true;
    bcc.enable = true;
    nm-applet.indicator = true;
    thunar.enable = true;
    virt-manager.enable = true;

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    xwayland.enable = true;
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # XDG Portals
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
  };

  # Base Desktop & Utility System Packages
  environment.systemPackages = (with pkgs; [
    btrfs-progs
    clang
    curl
    cpufrequtils
    glib
    gsettings-qt
    libappindicator
    libnotify
    openssl
    xdg-user-dirs
    xdg-utils
    libsForQt5.qtstyleplugin-kvantum
    networkmanagerapplet
    nvtopPackages.full
    polkit_gnome
    libsForQt5.qt5ct
    kdePackages.qtwayland
    kdePackages.qtstyleplugin-kvantum
    kdePackages.layer-shell-qt
    wallust
    thunar-archive-plugin
    thunar-volman
    tumbler
    devenv
    R
    logitech-udev-rules
    opentabletdriver
    syncthingtray
    android-tools
  ]) ++ [
    python-packages
  ];

  # Electron Wayland Environment Variable
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_STYLE_OVERRIDE = null;
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QML_IMPORT_PATH = "${pkgs.hyprland-qt-support}/lib/qt-6/qml";
  };
}
