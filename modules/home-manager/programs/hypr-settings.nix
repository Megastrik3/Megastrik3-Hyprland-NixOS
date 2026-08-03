{ lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    settings = {
    "$configs" = "$HOME/.config/hypr/configs";
    "$UserConfigs" = "$HOME/.config/hypr/UserConfigs";
    "$mainMod" = "SUPER";
    "$scriptsDir" = "$HOME/.config/hypr/scripts";
    "$UserScripts" = "$HOME/.config/hypr/UserScripts";
    "$edit" = "${EDITOR:-nano}";
    "$term" = "kitty";
    "$files" = "thunar";
    "$Search_Engine" = "\"https://www.google.com/search?q={}\"";
    "$wallDIR" = "$HOME/Pictures/wallpapers";
    "$lock" = "$scriptsDir/LockScreen.sh";
    "$SwwwRandom" = "$UserScripts/WallpaperAutoChange.sh";
    "$livewallpaper" = "\"\"";
    "$Touchpad_Device" = "asue1209:00-04f3:319f-touchpad";
    "$TOUCHPAD_ENABLED" = true;
    "$background" = "rgb(292929)";
    "$foreground" = "rgb(FAFAFA)";
    "$color0" = "rgb(4E4E4E)";
    "$color1" = "rgb(414141)";
    "$color2" = "rgb(626262)";
    "$color3" = "rgb(6D6D6D)";
    "$color4" = "rgb(A1A1A1)";
    "$color5" = "rgb(A9A9A9)";
    "$color6" = "rgb(B5B5B5)";
    "$color7" = "rgb(F0F0F0)";
    "$color8" = "rgb(A8A8A8)";
    "$color9" = "rgb(575757)";
    "$color10" = "rgb(828282)";
    "$color11" = "rgb(919191)";
    "$color12" = "rgb(D6D6D6)";
    "$color13" = "rgb(E2E2E2)";
    "$color14" = "rgb(F1F1F1)";
    "$color15" = "rgb(F0F0F0)";
    env = [
      "DOTS_VERSION,2.3.19"
      "GDK_BACKEND,wayland,x11,*"
      "QT_QPA_PLATFORM,wayland;xcb"
      "CLUTTER_BACKEND,wayland"
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "QT_QPA_PLATFORMTHEME,qt6ct"
      "QT_QUICK_CONTROLS_STYLE,org.hyprland.style"
      "GDK_SCALE,1"
      "QT_SCALE_FACTOR,1"
      "HYPRCURSOR_THEME,Bibata-Modern-Ice"
      "HYPRCURSOR_SIZE,24"
      "MOZ_ENABLE_WAYLAND,1"
      "ELECTRON_OZONE_PLATFORM_HINT,auto"
      "LIBVA_DRIVER_NAME,nvidia"
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "NVD_BACKEND,direct"
      "GSK_RENDERER,ngl"
    ];
    monitor = [
      #"DP-1,3840x2160@159.98,0x0,1.5"
      "DP-1,1920x1080@59.94,1920x0,1.0"
      "HDMI-A-1,1920x1080@59.94,0x0,1.0"
    ];
    workspace = [
      "special:term, on-created-empty:kitty --class kitty-dropterm, animation:slide top"
      "special:music, on-created-empty:pear-desktop, animation:slide right"
      "special:bitwarden, on-created-empty:bitwarden, animation:slide left"
      "1,monitor:HDMI-A-1,default:true"
      "2,monitor:HDMI-A-1"
      "3,monitor:HDMI-A-1"
      "4,monitor:HDMI-A-1"
      "5,monitor:HDMI-A-1"
      "6,monitor:DP-1"
      "7,monitor:DP-1"
      "8,monitor:DP-1"
      "9,monitor:DP-1"
      "10,monitor:DP-1"
    ];
    device = {
      "name" = "$Touchpad_Device";
      "enabled" = "$TOUCHPAD_ENABLED";
    };
    dwindle = {
      "preserve_split" = true;
      "special_scale_factor" = 0.8;
    };
    master = {
      "new_status" = "master";
      "new_on_top" = 1;
      "mfact" = 0.5;
    };
    general = {
      "resize_on_border" = true;
      "layout" = "dwindle";
      "border_size" = 2;
      "gaps_in" = 2;
      "gaps_out" = 4;
    };
    input = {
      "kb_layout" = "us";
      "kb_variant" = "";
      "kb_model" = "";
      "kb_options" = "";
      "kb_rules" = "";
      "repeat_rate" = 50;
      "repeat_delay" = 300;
      "sensitivity" = 0;
      "numlock_by_default" = true;
      "left_handed" = false;
      "follow_mouse" = 1;
      "mouse_refocus" = true;
      "float_switch_override_focus" = 1;
      "accel_profile" = "adaptive";
  
    touchpad = {
      "disable_while_typing" = true;
      "natural_scroll" = true;
      "clickfinger_behavior" = false;
      "middle_button_emulation" = false;
      "tap-to-click" = true;
      "drag_lock" = false;
   };
    touchdevice = {
      "enabled" = false;
    };
    tablet = {
      "transform" = 0;
      "left_handed" = 0;
      "relative_input" = false;
    };
  };
    gestures = {
      "workspace_swipe_distance" = 500;
      "workspace_swipe_invert" = true;
      "workspace_swipe_min_speed_to_force" = 30;
      "workspace_swipe_cancel_ratio" = 0.5;
      "workspace_swipe_create_new" = true;
      "workspace_swipe_forever" = true;
      gesture = [
        "3, horizontal, workspace"
        "4, up, dispatcher, exec, hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 1.5}')\""
        "4, down, dispatcher, exec, hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 1.5}')\""
        "3, up, dispatcher, exec, $scriptsDir/OverviewToggle.sh"
      ];
    };
    misc = {
      "disable_hyprland_logo" = true;
      "disable_splash_rendering" = true;
     # "vfr" = true;
      "vrr" = 2;
      "mouse_move_enables_dpms" = true;
      "enable_swallow" = "off";
      "swallow_regex" = "^(kitty)$";
      "focus_on_activate" = false;
      "initial_workspace_tracking" = 0;
      "middle_click_paste" = false;
      "enable_anr_dialog" = true;
      "anr_missed_pings" = 15;
      "allow_session_lock_restore" = true;
    };
    binds = {
      "workspace_back_and_forth" = true;
      "allow_workspace_cycles" = true;
      "pass_mouse_when_bound" = false;
    };
    xwayland = {
      "enabled" = true;
      "force_zero_scaling" = true;
    };
    render = {
      "direct_scanout" = 0;
    };
    cursor = {
      "sync_gsettings_theme" = true;
      "no_hardware_cursors" = 1;
      "enable_hyprcursor" = true;
      "warp_on_change_workspace" = 2;
      "no_warps" = true;
    };
    decoration = {
      "rounding" = 10;
      "active_opacity" = 1.0;
      "inactive_opacity" = 0.9;
      "fullscreen_opacity" = 1.0;
      "dim_inactive" = true;
      "dim_strength" = 0.1;
      "dim_special" = 0.0;
 
      shadow = {
        "enabled" = true;
        "range" = 3;
        "render_power" = 1;
        "color" = "$color12";
        "color_inactive" = "$color10";
      };
      blur = {
        "enabled" = true;
      };
    };
    animations = {
      "enabled" = true;
      bezier = [
        "myBezier, 0.05, 0.9, 0.1, 1.05"
        "linear, 0.0, 0.0, 1.0, 1.0"
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "slow, 0, 0.85, 0.3, 1"
        "overshot, 0.7, 0.6, 0.1, 1.1"
        "bounce, 1.1, 1.6, 0.1, 0.85"
        "sligshot, 1, -1, 0.15, 1.25"
        "nice, 0, 6.9, 0.5, -4.20"
      ];
      animation = [
        "windowsIn, 1, 5, slow, popin"
        "windowsOut, 1, 5, winOut, popin"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 10, linear"
        "borderangle, 1, 180, linear, loop"
        "fade, 1, 5, overshot"
        "workspaces, 1, 5, wind"
        "specialWorkspaceIn, 1, 4, wind, slide top"
        "specialWorkspaceOut, 1, 4, wind, slide top"
        "windows, 1, 5, bounce, popin"
      ];
    };
  };
};
}
