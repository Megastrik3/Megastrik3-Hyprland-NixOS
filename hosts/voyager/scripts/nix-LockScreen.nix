{ pkgs }:

pkgs.writeShellScriptBin "nix-LockScreen" ''

# For Hyprlock
#pidof hyprlock || hyprlock -q

# Ensure weather cache is up-to-date before locking (Waybar/lockscreen readers)
bash "$HOME/.config/hypr/UserScripts/WeatherWrap.sh" >/dev/null 2>&1

hyprlock -q
#loginctl lock-session
''
