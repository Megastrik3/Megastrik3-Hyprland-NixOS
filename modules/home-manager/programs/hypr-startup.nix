{ lib, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE"
      "qs -c overview"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "hypridle &"
      "noctalia-shell &"
      "sleep 3 && bitwarden &"
      "sleep 3 && solaar --battery-icons solaar -w hide &"
      "sleep 3 && syncthingtray --wait &"
      "sleep 3 && trayscale --hide-window &"
      "sleep 3 && vesktop -m &"
      "sleep 3 && steam -silent &"
    ];
  };
}
