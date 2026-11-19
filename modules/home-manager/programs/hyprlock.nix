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
        lock_cmd = "${pkgs.noctalia}/bin/noctalia msg session lock";       # lock noctalia lockscreen
        before_sleep_cmd = "${pkgs.noctalia}/bin/noctalia msg session lock"; # ensures that the session is locked before going to sleep
        after_sleep_cmd = "hyprctl dispatch 'hl.dsp.dpms(\"on\")'";  # turn on screen after system sleep/resume
        ignore_dbus_inhibit = true;                    # ignore dbus idle-inhibit requests to prevent random software wakeups
      };

      listener = [
        # Screenlock (Option B: Keep Noctalia lockscreen, avoid DPMS off crash)
        {
          timeout = 600; # 10 min
          on-timeout = "${pkgs.noctalia}/bin/noctalia msg session lock";
        }
      ];
    };
  };
}