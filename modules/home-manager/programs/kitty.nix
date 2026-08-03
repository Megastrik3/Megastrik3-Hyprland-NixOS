{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.size = 14.0;
    #themeFile = "Obsidian";
    font.name = "FantasqueSansM Nerd Font Mono Bold";
    extraConfig = ''
      background_opacity 0.9
      dynamic_background_opacity 1
      confirm_os_window_close 0

      # Animated cursor
      cursor_trail 1

      # change to x11 or wayland or leave auto
      linux_display_server auto

      scrollback_lines 2000
      wheel_scroll_min_lines 1

      enable_audio_bell no

      window_padding_width 4

    '';
  };
}
