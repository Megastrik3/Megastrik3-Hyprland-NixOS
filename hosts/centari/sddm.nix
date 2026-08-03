{pkgs, inputs, ...}: let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    themeConfig = {
      AccentColor = "#746385";
      FormPosition = "left";
      ForceHideCompletePassword = true;
    };
  };
in {
  services.displayManager.sddm = {
    enable = true;
    
    # We need the Qt6 version of SDDM for KWin to work best
    package = pkgs.kdePackages.sddm; 

    theme = "sddm-astronaut-theme";
    
    # Injecting the theme AND core Qt6 dependencies to prevent silent QML rendering crashes
    extraPackages = with pkgs.kdePackages; [ 
      sddm-astronaut 
      qtsvg 
      qtmultimedia 
      qtdeclarative
    ];

    wayland = {
      enable = true;
      compositor = "kwin"; # Forces SDDM to use KWin instead of Weston
    };
  };

  environment.systemPackages = [ sddm-astronaut ];
}