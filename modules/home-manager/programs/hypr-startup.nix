{ lib, ... }:
{
  wayland.windowManager.hyprland.extraLuaFiles."20-startup".content = ''
    -- Autostart processes for Hyprland 0.57+
    hl.on("hyprland.start", function()
        hl.exec_cmd("uwsm finalize HYPRLAND_INSTANCE_SIGNATURE")
        hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE")
        hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE")
        hl.exec_cmd("qs -c overview")
        hl.exec_cmd("wl-paste --type text --watch cliphist store")
        hl.exec_cmd("wl-paste --type image --watch cliphist store")
        hl.exec_cmd("noctalia")
        hl.exec_cmd("pypr")
        hl.exec_cmd("sleep 3 && solaar --battery-icons solaar -w hide")
        hl.exec_cmd("sleep 3 && trayscale --hide-window")
        hl.exec_cmd("sleep 3 && vesktop -m")
        hl.exec_cmd("sleep 3 && steam -silent")
    end)
  '';
}
