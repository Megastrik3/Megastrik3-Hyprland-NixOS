{ config, pkgs, ... }:

{
  # Your existing hyprlock config
  programs.hyprlock = {
    enable = true;
  };

  # The requested hypridle config
  services.hypridle = {
    enable = true;
    
    # Using 'settings' is the preferred Home Manager method
    settings = {
      general = {
        lock_cmd = "noctalia-shell ipc call lockScreen lock";       # lock noctalia lockscreen
        before_sleep_cmd = "noctalia-shell ipc call lockScreen lock"; # ensures that the session is locked before going to sleep
        after_sleep_cmd = "hyprctl dispatch dpms on";  # turn on screen after system sleep/resume
        ignore_dbus_inhibit = true;                    # ignore dbus idle-inhibit requests to prevent random software wakeups
      };

      listener = [
        # Aggressive screen off (ONLY when locked)
        {
          timeout = 30;
          # Check if the lock file exists. If yes, turn off screen.
          on-timeout = "test -f /tmp/noctalia.lock && hyprctl dispatch dpms off";
        }
        
        # Screenlock
        {
          timeout = 600; # 10 min
          on-timeout = "noctalia-shell ipc call lockScreen lock";
        }
        
        # Turn off screen
        {
          timeout = 630; # 10.5 min
          on-timeout = "hyprctl dispatch dpms off";
        }
      ];
    };
  };
}