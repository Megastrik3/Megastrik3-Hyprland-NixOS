# Variables

let
  localConfig = if builtins.pathExists ../../local-config.nix
                then import ../../local-config.nix
                else {};
  defaults = {
    # Git Configuration ( For Pulling Software Repos )
    gitUsername = "YOUR_USERNAME";
    gitEmail = "YOUR_EMAIL@example.com";

    # Hyprland Settings
    extraMonitorSettings = "";

    # Waybar Settings
    clock24h = true;

    # Program Options
    browser = "vivaldi"; # Set Default Browser
    terminal = "kitty"; # Set Default System Terminal
    keyboardLayout = "us";
  };
in
defaults // localConfig
