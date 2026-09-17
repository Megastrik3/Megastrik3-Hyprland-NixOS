{ pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;

    settings = {
      shell = {
        telemetry_enabled = false;
        corner_radius_scale = 1.0;
        avatar_path = "~/Pictures/risingtide_logo.png";
        animation = {
          enabled = true;
          speed = 1.0;
        };
        shadow = {
          direction = "down";
          alpha = 0.55;
        };
        panel = {
          borders = false;
          launcher_placement = "floating";
          launcher_position = "center";
          control_center_placement = "attached";
          session_placement = "attached";
          wallpaper_placement = "attached";
        };
        launcher = {
          categories = true;
          sort_by_usage = true;
          app_grid = false;
        };
      };

      lockscreen = {
        enabled = true;
        blur_intensity = 0.11;
        tint_intensity = 0.1;
        monitors = [ "HDMI-A-1" ];
      };

      location = {
        auto_locate = false;
        address = "Detroit, Michigan, United States";
      };

      weather = {
        enabled = true;
        unit = "fahrenheit";
        effects = true;
      };

      control_center.calendar = {
        show_events_card = true;
        show_week_numbers = false;
      };

      wallpaper = {
        enabled = true;
        directory = "~/Pictures/wallpapers";
        fill_mode = "crop";
        fill_color = "#000000";
        transition = [ "fade" ];
        transition_duration = 1500;
        edge_smoothness = 0.05;
        transition_on_startup = false;
        automation = {
          enabled = false;
          interval_seconds = 300;
          order = "random";
          recursive = true;
        };
      };

      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-tonal-spot";
        templates = {
          enable_builtin_templates = true;
          builtin_ids = [ "gtk3" "gtk4" "qt" "kitty" "hyprland" ];
        };
      };

      system.monitor = {
        enabled = true;
        cpu_poll_seconds = 2.0;
        gpu_poll_seconds = 5.0;
        memory_poll_seconds = 2.0;
        disk_poll_seconds = 10.0;
      };

      audio.enable_overdrive = false;

      brightness.enable_ddcutil = true;

      notification = {
        enable_daemon = true;
        layer = "overlay";
        background_opacity = 1.0;
      };

      osd = {
        position = "top_right";
        background_opacity = 1.0;
        monitors = [ "HDMI-A-1" ];
      };

      dock.enabled = false;

      bar.main = {
        position = "top";
        thickness = 34;
        background_opacity = 0.85;
        radius = 12;
        margin_ends = 6;
        margin_edge = 6;
        padding = 2;
        widget_spacing = 6;
        reserve_space = true;

        start = [ "control-center" "workspaces" "tray" "media" ];
        center = [ "notifications" "clock" "caffeine" "taskbar" ];
        end = [ "sysmon" "volume" "session" ];

        monitor.dp1 = {
          match = "DP-1";
          start = [ "control-center" "workspaces" "tray" "media" "notifications" ];
          center = [ ];
          end = [ "volume" "sysmon" "clock" ];
        };
      };

      widget = {
        workspaces = {
          style = "regular";
          show_labels = false;
        };
        tray = {
          hide_passive = false;
          pinned = [ "Vesktop" "Bitwarden" "dev.deedles.Trayscale" "pear-desktop" ];
        };
        media = {
          max_length = 250;
          title_scroll = "on_hover";
          artist_first = false;
        };
        clock = {
          format = "%-I:%M %p";
          tooltip_format = "%H:%M %a, %b %d";
        };
        volume.actions = {
          middle = "exec pwvucontrol || pavucontrol";
        };
      };

      hooks = {
        started = "rm -f /tmp/noctalia.lock";
        session_locked = "touch /tmp/noctalia.lock";
        session_unlocked = "rm -f /tmp/noctalia.lock";
        wallpaper_changed = "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' && gsettings set org.gnome.desktop.interface gtk-theme 'Colloid-Dark'";
      };

      idle.behavior = {
        lock.enabled = false;
        "screen-off".enabled = false;
      };
    };
  };
}
