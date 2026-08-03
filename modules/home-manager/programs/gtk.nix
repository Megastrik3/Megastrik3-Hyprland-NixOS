{ config, pkgs, ... }:

let
  slot-icon-theme = pkgs.stdenv.mkDerivation {
    pname = "slot-icon-theme";
    version = "master";
    dontWrapQtApps = true;
    src = pkgs.fetchzip {
      url = "https://github.com/L4ki/Slot-Plasma-Themes/archive/master.tar.gz";
      hash = "sha256-xTFKvZfYzOujTMKObJ4UZEi1n0fjvP4BSmAJmklw8Us=";
    };
    nativeBuildInputs = [ pkgs.gtk3 ];
    propagatedBuildInputs = [
      pkgs.kdePackages.breeze-icons
      pkgs.adwaita-icon-theme
      pkgs.hicolor-icon-theme
    ];
    installPhase = ''
      mkdir -p $out/share/icons
      cp -r "Slot Icons Themes/"* $out/share/icons/
      for d in $out/share/icons/*; do
        if [ -d "$d" ]; then
          ${pkgs.gtk3}/bin/gtk-update-icon-cache -f -t "$d" || true
        fi
      done
    '';
  };
in
{
  home.packages = with pkgs; [
    slot-icon-theme
    kdePackages.breeze-icons
    adwaita-icon-theme
    hicolor-icon-theme
  ];

  gtk = {
    enable = true;

    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme.override {
        colorVariants = [ "dark" ];
        tweaks = [ "black" ];
      };
    };

    iconTheme = {
      name = "Slot-Gradient-Dark-Icons";
      package = slot-icon-theme;
    };

    font = {
      name = "Adwaita Sans";
      size = 12;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      size = 24;
      package = pkgs.bibata-cursors;
    };

    gtk3.extraConfig = {
      gtk-toolbar-style = "GTK_TOOLBAR_ICONS";
      gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
      gtk-button-images = 1;
      gtk-menu-images = 1;
      gtk-enable-event-sounds = 1;
      gtk-enable-input-feedback-sounds = 0;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
      gtk-application-prefer-dark-theme = 1;
    };

    gtk3.extraCss = ''
      @import url("noctalia.css");

      /* Apply Noctalia dynamic wallpaper colors to GTK3 apps (Thunar, Mousepad, etc.) */
      window, .window-frame, dialog, headerbar, toolbar, .titlebar {
        background-color: @window_bg_color;
        color: @window_fg_color;
      }

      sidebar, .sidebar, scrolledwindow.sidebar, treeview {
        background-color: @sidebar_bg_color;
        color: @sidebar_fg_color;
      }

      treeview:selected, row:selected, entry:focus, button.suggested-action {
        background-color: @accent_bg_color;
        color: @accent_fg_color;
      }
    '';

    gtk4.theme = config.gtk.theme;
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-cursor-theme-size = 24;
    };
    gtk4.extraCss = ''
      @import url("noctalia.css");
    '';
  };

  # 2. RESTORE ASSETS LINK (allows GTK4 apps to find theme assets while keeping gtk.css writeable for Noctalia)
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
  };

  # 3. KEEP DARK MODE SIGNAL AND SYNC GTK INTERFACE SETTINGS
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = config.gtk.theme.name;
      icon-theme = config.gtk.iconTheme.name;
      cursor-theme = config.gtk.cursorTheme.name;
      cursor-size = config.gtk.cursorTheme.size;
      font-name = "${config.gtk.font.name} ${toString config.gtk.font.size}";
    };
  };

  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Ice";
    size = 24;
    package = pkgs.bibata-cursors;
    gtk.enable = true;
    x11.enable = true;
  };
}