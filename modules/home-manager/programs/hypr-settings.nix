{ lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    configType = "lua";

    extraConfig = ''
      -- For Noctalia Color templates
      pcall(function()
        require("noctalia").apply_theme()
      end)
    '';

    extraLuaFiles."00-settings".content = ''
      -- Global variables
      mainMod = "SUPER"
      term = "kitty"
      files = "thunar"
      edit = os.getenv("EDITOR") or "nano"
      local home = os.getenv("HOME") or ""
      configs = home .. "/.config/hypr/configs"
      UserConfigs = home .. "/.config/hypr/UserConfigs"
      scriptsDir = home .. "/.config/hypr/scripts"
      UserScripts = home .. "/.config/hypr/UserScripts"
      Search_Engine = "https://www.google.com/search?q={}"
      wallDIR = home .. "/Pictures/wallpapers"
      lock = scriptsDir .. "/LockScreen.sh"
      SwwwRandom = UserScripts .. "/WallpaperAutoChange.sh"
      livewallpaper = ""
      Touchpad_Device = "asue1209:00-04f3:319f-touchpad"
      TOUCHPAD_ENABLED = true

      -- Colors
      background = "rgb(292929)"
      foreground = "rgb(FAFAFA)"
      color0 = "rgb(4E4E4E)"
      color1 = "rgb(414141)"
      color2 = "rgb(626262)"
      color3 = "rgb(6D6D6D)"
      color4 = "rgb(A1A1A1)"
      color5 = "rgb(A9A9A9)"
      color6 = "rgb(B5B5B5)"
      color7 = "rgb(F0F0F0)"
      color8 = "rgb(A8A8A8)"
      color9 = "rgb(575757)"
      color10 = "rgb(828282)"
      color11 = "rgb(919191)"
      color12 = "rgb(D6D6D6)"
      color13 = "rgb(E2E2E2)"
      color14 = "rgb(F1F1F1)"
      color15 = "rgb(F0F0F0)"

      -- Environment variables
      hl.env("DOTS_VERSION", "2.3.19")
      hl.env("GDK_BACKEND", "wayland,x11,*")
      hl.env("QT_QPA_PLATFORM", "wayland;xcb")
      hl.env("CLUTTER_BACKEND", "wayland")
      hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
      hl.env("XDG_SESSION_DESKTOP", "Hyprland")
      hl.env("XDG_SESSION_TYPE", "wayland")
      hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
      hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
      hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
      hl.env("QT_QUICK_CONTROLS_STYLE", "org.hyprland.style")
      hl.env("GDK_SCALE", "1")
      hl.env("QT_SCALE_FACTOR", "1")
      hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
      hl.env("HYPRCURSOR_SIZE", "24")
      hl.env("MOZ_ENABLE_WAYLAND", "1")
      hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
      hl.env("LIBVA_DRIVER_NAME", "nvidia")
      hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
      hl.env("NVD_BACKEND", "direct")
      hl.env("GSK_RENDERER", "ngl")

      -- Monitors
      hl.monitor({ output = "HDMI-A-1", mode = "3840x2160@160", position = "0x0", scale = 1.5 })
      hl.monitor({ output = "DP-1", mode = "1920x1080@60", position = "2560x0", scale = 1.0 })

      -- Workspaces
      hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", default = true })
      hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1" })
      hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1" })
      hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1" })
      hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1" })
      hl.workspace_rule({ workspace = "6", monitor = "DP-1" })
      hl.workspace_rule({ workspace = "7", monitor = "DP-1" })
      hl.workspace_rule({ workspace = "8", monitor = "DP-1" })
      hl.workspace_rule({ workspace = "9", monitor = "DP-1" })
      hl.workspace_rule({ workspace = "10", monitor = "DP-1" })
      hl.workspace_rule({ workspace = "special:special", gaps_out = 60, gaps_in = 20 })

      -- Per-device config
      hl.device({
          name = Touchpad_Device,
          enabled = TOUCHPAD_ENABLED,
      })

      -- Core configuration
      hl.config({
          general = {
              resize_on_border = true,
              layout = "dwindle",
              border_size = 2,
              gaps_in = 2,
              gaps_out = 4,
          },
          dwindle = {
              preserve_split = true,
          },
          master = {
              new_status = "master",
              new_on_top = true,
              mfact = 0.5,
          },
          input = {
              kb_layout = "us",
              kb_variant = "",
              kb_model = "",
              kb_options = "",
              kb_rules = "",
              repeat_rate = 50,
              repeat_delay = 300,
              sensitivity = 0,
              numlock_by_default = true,
              left_handed = false,
              follow_mouse = 1,
              mouse_refocus = true,
              float_switch_override_focus = 1,
              accel_profile = "adaptive",

              touchpad = {
                  disable_while_typing = true,
                  natural_scroll = true,
                  clickfinger_behavior = false,
                  middle_button_emulation = false,
                  tap_to_click = true,
                  drag_lock = false,
              },
              touchdevice = {
                  enabled = false,
              },
              tablet = {
                  transform = 0,
                  left_handed = 0,
                  relative_input = false,
              },
          },
          gestures = {
              workspace_swipe_distance = 500,
              workspace_swipe_invert = true,
              workspace_swipe_min_speed_to_force = 30,
              workspace_swipe_cancel_ratio = 0.5,
              workspace_swipe_create_new = true,
              workspace_swipe_forever = true,
          },
          misc = {
              disable_hyprland_logo = true,
              disable_splash_rendering = true,
              vrr = 2,
              mouse_move_enables_dpms = true,
              key_press_enables_dpms = true,
              enable_swallow = false,
              swallow_regex = "^(kitty)$",
              focus_on_activate = false,
              initial_workspace_tracking = 0,
              middle_click_paste = false,
              enable_anr_dialog = true,
              anr_missed_pings = 15,
              allow_session_lock_restore = true,
          },
          debug = {
              disable_logs = false,
              enable_stdout_logs = true,
          },
          binds = {
              workspace_back_and_forth = true,
              allow_workspace_cycles = true,
              pass_mouse_when_bound = false,
          },
          xwayland = {
              enabled = true,
              force_zero_scaling = true,
          },
          render = {
              direct_scanout = 0,
          },
          cursor = {
              sync_gsettings_theme = true,
              no_hardware_cursors = 1,
              enable_hyprcursor = true,
              warp_on_change_workspace = 2,
              no_warps = true,
          },
          decoration = {
              rounding = 10,
              active_opacity = 1.0,
              inactive_opacity = 0.9,
              fullscreen_opacity = 1.0,
              dim_inactive = true,
              dim_strength = 0.1,
              dim_special = 0.0,

              shadow = {
                  enabled = true,
                  range = 3,
                  render_power = 1,
                  color = color12,
                  color_inactive = color10,
              },
              blur = {
                  enabled = true,
              },
          },
          animations = {
              enabled = true,
          },
      })

      -- Gestures
      hl.gesture({
          fingers = 3,
          direction = "horizontal",
          action = "workspace",
      })

      -- Curves
      hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
      hl.curve("linear",   { type = "bezier", points = { {0.0, 0.0}, {1.0, 1.0} } })
      hl.curve("wind",     { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
      hl.curve("winIn",    { type = "bezier", points = { {0.1, 1.1}, {0.1, 1.1} } })
      hl.curve("winOut",   { type = "bezier", points = { {0.3, -0.3}, {0, 1} } })
      hl.curve("slow",     { type = "bezier", points = { {0, 0.85}, {0.3, 1} } })
      hl.curve("overshot", { type = "bezier", points = { {0.7, 0.6}, {0.1, 1.1} } })
      hl.curve("bounce",   { type = "bezier", points = { {1.1, 1.6}, {0.1, 0.85} } })
      hl.curve("sligshot", { type = "bezier", points = { {1, -1}, {0.15, 1.25} } })

      -- Animations
      hl.animation({ leaf = "windowsIn",          enabled = true, speed = 5, bezier = "slow",     style = "popin" })
      hl.animation({ leaf = "windowsOut",         enabled = true, speed = 5, bezier = "winOut",   style = "popin" })
      hl.animation({ leaf = "windowsMove",        enabled = true, speed = 5, bezier = "wind",     style = "slide" })
      hl.animation({ leaf = "border",             enabled = true, speed = 10, bezier = "linear" })
      hl.animation({ leaf = "borderangle",        enabled = true, speed = 100, bezier = "linear", style = "loop" })
      hl.animation({ leaf = "fade",               enabled = true, speed = 5, bezier = "overshot" })
      hl.animation({ leaf = "workspaces",         enabled = true, speed = 5, bezier = "wind" })
      hl.animation({ leaf = "specialWorkspaceIn",  enabled = true, speed = 4, bezier = "wind",     style = "slide top" })
      hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 4, bezier = "wind",     style = "slide top" })
      hl.animation({ leaf = "windows",            enabled = true, speed = 5, bezier = "bounce",   style = "popin" })
    '';
  };
}
