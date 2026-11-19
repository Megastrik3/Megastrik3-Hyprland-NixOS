{ lib, ... }:
{
  wayland.windowManager.hyprland.extraLuaFiles."10-keybinds".content = ''

-- Keybindings for Hyprland 0.57+
local mainMod = "SUPER"
local term = term or "kitty"
local files = files or "thunar"
local scriptsDir = scriptsDir or (os.getenv("HOME") .. "/.config/hypr/scripts")

-- Application shortcuts & controls
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"), { desc = "all launcher" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd('xdg-open "https://"'), { desc = "open default browser" })
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("nix-OverviewToggle"), { desc = "desktop overview" })
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(term), { desc = "Open terminal" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(files), { desc = "file manager" })
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("noctalia msg panel-toggle kenn/keybind-cheatsheet:cheatsheet"), { desc = "keybind cheatsheet" })
hl.bind(mainMod .. " + ALT + E", hl.dsp.exec_cmd('noctalia msg panel-toggle launcher "/emo "'), { desc = "emoji picker" })
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("nix-RofiSearch"), { desc = "web search" })
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("noctalia msg window-switcher"), { desc = "window switcher" })
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd(scriptsDir .. "/GameMode.sh"), { desc = "toggle game mode" })
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd(scriptsDir .. "/ChangeLayout.sh"), { desc = "toggle master/dwindle layout" })
hl.bind(mainMod .. " + ALT + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"), { desc = "clipboard manager" })
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("noctalia msg settings-toggle theme"), { desc = "noctalia theme settings" })
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen(), { desc = "fullscreen" })
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen(1), { desc = "maximize window" })
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }), { desc = "Float current window" })
hl.bind(mainMod .. " + ALT + SPACE", hl.dsp.exec_cmd("hyprctl dispatch workspaceopt allfloat"), { desc = "Float all windows" })
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd("pypr toggle term"), { desc = "DropDown terminal" })

hl.bind(mainMod .. " + ALT + mouse_down", hl.dsp.exec_cmd([[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 2.0}')"]]), { desc = "zoom in" })
hl.bind(mainMod .. " + ALT + mouse_up", hl.dsp.exec_cmd([[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 2.0}')"]]), { desc = "zoom out" })

hl.bind(mainMod .. " + CTRL + ALT + B", hl.dsp.exec_cmd("noctalia msg bar-toggle"), { desc = "toggle bar" })
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("pypr toggle music"), { desc = "online music" })
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("pypr toggle bitwarden"), { desc = "bitwarden scratchpad" })
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("noctalia msg panel-toggle wallpaper"), { desc = "select wallpaper" })
hl.bind("CTRL + ALT + W", hl.dsp.exec_cmd("noctalia msg wallpaper-random"), { desc = "random wallpaper" })
hl.bind(mainMod .. " + CTRL + O", hl.dsp.exec_cmd("hyprctl setprop active opaque toggle"), { desc = "toggle active window opacity" })
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd(scriptsDir .. "/Animations.sh"), { desc = "animations menu" })
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("nix-ZshChangeTheme"), { desc = "change oh-my-zsh theme" })
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd('noctalia msg panel-toggle launcher "/calc "'), { desc = "calculator" })

-- Move workspace to monitor
hl.bind(mainMod .. " + CTRL + F9", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor l"), { desc = "move workspace to left monitor" })
hl.bind(mainMod .. " + CTRL + F10", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor r"), { desc = "move workspace to right monitor" })
hl.bind(mainMod .. " + CTRL + F11", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor u"), { desc = "move workspace to up monitor" })
hl.bind(mainMod .. " + CTRL + F12", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor d"), { desc = "move workspace to down monitor" })

hl.bind("CTRL + ALT + Delete", hl.dsp.exit(), { desc = "exit Hyprland" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { desc = "close active window" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("nix-KillActiveProcess"), { desc = "Terminate active process" })
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd("noctalia msg session lock"), { desc = "lock screen" })
hl.bind("CTRL + ALT + P", hl.dsp.exec_cmd("noctalia msg panel-toggle session"), { desc = "powermenu" })
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center notifications"), { desc = "notification panel" })
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"), { desc = "Quick settings menu" })

-- Layout controls
hl.bind(mainMod .. " + CTRL + D", hl.dsp.layout("removemaster"), { desc = "remove master" })
hl.bind(mainMod .. " + I", hl.dsp.layout("addmaster"), { desc = "add master" })
hl.bind(mainMod .. " + CTRL + Return", hl.dsp.layout("swapwithmaster"), { desc = "swap with master" })
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprctl dispatch splitratio 0.3"), { desc = "set split ratio 0.3" })

-- Window focus and cycling
hl.bind("ALT + Tab", hl.dsp.window.cycle_next(), { desc = "cycle next window" })
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }), { desc = "focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }), { desc = "focus right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }), { desc = "focus up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }), { desc = "focus down" })

-- Move window
hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.move({ direction = "l" }), { desc = "move window left" })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ direction = "r" }), { desc = "move window right" })
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.move({ direction = "u" }), { desc = "move window up" })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.move({ direction = "d" }), { desc = "move window down" })

-- Swap window
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.swap({ direction = "l" }), { desc = "swap window left" })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.swap({ direction = "r" }), { desc = "swap window right" })
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.swap({ direction = "u" }), { desc = "swap window up" })
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.swap({ direction = "d" }), { desc = "swap window down" })

-- Resize active window
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true, desc = "resize left (-50)" })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true, desc = "resize right (+50)" })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true, desc = "resize up (-50)" })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true, desc = "resize down (+50)" })

-- Groups
hl.bind(mainMod .. " + G", hl.dsp.group.toggle(), { desc = "toggle group" })
hl.bind(mainMod .. " + Tab", hl.dsp.group.next(), { desc = "Change Group Forward" })
hl.bind(mainMod .. " + CTRL + Tab", hl.dsp.group.next(), { desc = "change active in group" })
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.group.prev(), { desc = "Change Group Back" })
hl.bind(mainMod .. " + CTRL + K", hl.dsp.group.move_window({ direction = "l" }), { desc = "Move left into group" })
hl.bind(mainMod .. " + CTRL + L", hl.dsp.group.move_window({ direction = "r" }), { desc = "Move Right into group" })
hl.bind(mainMod .. " + CTRL + H", hl.dsp.exec_cmd("hyprctl dispatch moveoutofgroup"), { desc = "Move active out of group" })

-- Special workspace
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "special" }), { desc = "move to special workspace" })
hl.bind(mainMod .. " + U", hl.dsp.workspace.toggle_special(), { desc = "toggle special workspace" })

-- Workspaces 1-10
for i = 1, 10 do
    local code = tostring(9 + i)
    local ws = tostring(i)
    hl.bind(mainMod .. " + code:" .. code, hl.dsp.focus({ workspace = i }), { desc = "workspace " .. ws })
    hl.bind(mainMod .. " + SHIFT + code:" .. code, hl.dsp.window.move({ workspace = i }), { desc = "move to workspace " .. ws })
    hl.bind(mainMod .. " + CTRL + code:" .. code, hl.dsp.window.move({ workspace = i, silent = true }), { desc = "move silently to workspace " .. ws })
end

-- Workspace navigation
hl.bind(mainMod .. " + SHIFT + bracketleft", hl.dsp.window.move({ workspace = "-1" }), { desc = "move to previous workspace" })
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.window.move({ workspace = "+1" }), { desc = "move to next workspace" })
hl.bind(mainMod .. " + CTRL + bracketleft", hl.dsp.window.move({ workspace = "-1", silent = true }), { desc = "move silently to previous workspace" })
hl.bind(mainMod .. " + CTRL + bracketright", hl.dsp.window.move({ workspace = "+1", silent = true }), { desc = "move silently to next workspace" })
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { desc = "next workspace" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { desc = "previous workspace" })
hl.bind(mainMod .. " + period", hl.dsp.focus({ workspace = "e+1" }), { desc = "next workspace" })
hl.bind(mainMod .. " + comma", hl.dsp.focus({ workspace = "e-1" }), { desc = "previous workspace" })

-- Screenshots
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen"), { desc = "screenshot fullscreen" })
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("noctalia msg screenshot-region"), { desc = "screenshot (region)" })
hl.bind(mainMod .. " + CTRL + Print", hl.dsp.exec_cmd("sleep 5 && noctalia msg screenshot-fullscreen"), { desc = "screenshot in 5s" })
hl.bind(mainMod .. " + CTRL + SHIFT + Print", hl.dsp.exec_cmd("sleep 10 && noctalia msg screenshot-fullscreen"), { desc = "screenshot in 10s" })
hl.bind("ALT + Print", hl.dsp.exec_cmd("noctalia msg screenshot-window"), { desc = "screenshot active window" })
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("noctalia msg screenshot-region --annotate"), { desc = "screenshot (annotate)" })
hl.bind(mainMod .. " + ALT + Print", hl.dsp.exec_cmd("noctalia msg annotate"), { desc = "screen annotate" })
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen"))
hl.bind(mainMod .. " + SHIFT + F6", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
hl.bind(mainMod .. " + CTRL + F6", hl.dsp.exec_cmd("sleep 5 && noctalia msg screenshot-fullscreen"))
hl.bind(mainMod .. " + ALT + F6", hl.dsp.exec_cmd("noctalia msg screenshot-region --annotate"))
hl.bind("ALT + F6", hl.dsp.exec_cmd("noctalia msg screenshot-window"))

-- Hardware & function keys
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("killall -SIGUSR1 gpu-screen-recorder"))
hl.bind("xf86Launch1", hl.dsp.exec_cmd("rog-control-center"))
hl.bind("xf86Launch3", hl.dsp.exec_cmd("asusctl led-mode -n"))
hl.bind("xf86Launch4", hl.dsp.exec_cmd("asusctl profile -n"))
hl.bind("xf86TouchpadToggle", hl.dsp.exec_cmd(scriptsDir .. "/TouchPad.sh"))

-- Global layout switch
hl.bind("ALT_L + SHIFT_L", hl.dsp.exec_cmd("noctalia msg keyboard-layout-cycle"), { locked = true, non_consuming = true, desc = "switch keyboard layout globally" })

-- Audio controls
hl.bind("xf86audioraisevolume", hl.dsp.exec_cmd("noctalia msg volume-up"), { locked = true, repeating = true, desc = "volume up" })
hl.bind("xf86audiolowervolume", hl.dsp.exec_cmd("noctalia msg volume-down"), { locked = true, repeating = true, desc = "volume down" })
hl.bind("xf86AudioMicMute", hl.dsp.exec_cmd("noctalia msg mic-mute"), { locked = true, desc = "toggle mic mute" })
hl.bind("xf86audiomute", hl.dsp.exec_cmd("noctalia msg volume-mute"), { locked = true, desc = "toggle mute" })
hl.bind("xf86AudioPlay", hl.dsp.exec_cmd("noctalia msg media toggle"), { locked = true, desc = "play" })
hl.bind("xf86AudioNext", hl.dsp.exec_cmd("noctalia msg media next"), { locked = true, desc = "next track" })
hl.bind("xf86AudioPrev", hl.dsp.exec_cmd("noctalia msg media previous"), { locked = true, desc = "previous track" })
hl.bind("xf86audiostop", hl.dsp.exec_cmd("noctalia msg media stop"), { locked = true, desc = "stop" })

-- Brightness
hl.bind("xf86KbdBrightnessDown", hl.dsp.exec_cmd("noctalia msg keyboard-backlight-down"), { repeating = true })
hl.bind("xf86KbdBrightnessUp", hl.dsp.exec_cmd("noctalia msg keyboard-backlight-up"), { repeating = true })
hl.bind("xf86MonBrightnessDown", hl.dsp.exec_cmd("noctalia msg brightness-down"), { repeating = true })
hl.bind("xf86MonBrightnessUp", hl.dsp.exec_cmd("noctalia msg brightness-up"), { repeating = true })

-- Mouse dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { drag = true, desc = "move window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { drag = true, desc = "resize window" })

  '';
}
