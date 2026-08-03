{ pkgs, inputs, ... }:
{
  imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia-shell = {
      enable = true;
      settings = {
        settingsVersion = 57;
        
        bar = {
          barType = "floating";
          position = "top";
          monitors = [ ];
          density = "compact";
          showOutline = false;
          showCapsule = false;
          capsuleOpacity = 1;
          capsuleColorKey = "none";
          widgetSpacing = 6;
          contentPadding = 2;
          fontScale = 1;
          backgroundOpacity = 0.93;
          useSeparateOpacity = false;
          floating = true;
          marginVertical = 6;
          marginHorizontal = 4;
          frameThickness = 8;
          frameRadius = 12;
          outerCorners = false;
          hideOnOverview = false;
          displayMode = "always_visible";
          autoHideDelay = 500;
          autoShowDelay = 150;
          showOnWorkspaceSwitch = true;
          
          widgets = {
            left = [
              {
                colorizeDistroLogo = false;
                colorizeSystemIcon = "none";
                customIconPath = "";
                enableColorization = false;
                icon = "noctalia";
                id = "ControlCenter";
                useDistroLogo = false;
              }
              {
                characterCount = 2;
                colorizeIcons = false;
                emptyColor = "secondary";
                enableScrollWheel = true;
                focusedColor = "primary";
                followFocusedScreen = false;
                fontWeight = "bold";
                groupedBorderOpacity = 1;
                hideUnoccupied = false;
                iconScale = 0.8;
                id = "Workspace";
                labelMode = "none";
                occupiedColor = "secondary";
                pillSize = 0.6;
                showApplications = false;
                showBadge = true;
                showLabelsOnlyWhenOccupied = true;
                unfocusedIconsOpacity = 1;
              }
              {
                blacklist = [ ];
                chevronColor = "none";
                colorizeIcons = false;
                drawerEnabled = false;
                hidePassive = false;
                id = "Tray";
                pinned = [
                  "Vesktop"
                  "Bitwarden"
                  "dev.deedles.Trayscale"
                  "syncthingtray"
                  "pear-desktop"
                ];
              }
              {
                compactMode = true;
                hideMode = "idle";
                hideWhenIdle = false;
                id = "MediaMini";
                maxWidth = 250;
                panelShowAlbumArt = true;
                scrollingMode = "hover";
                showAlbumArt = true;
                showArtistFirst = false;
                showProgressRing = true;
                showVisualizer = true;
                textColor = "none";
                useFixedWidth = false;
                visualizerType = "linear";
              }
            ];
            
            center = [
              {
                hideWhenZero = false;
                hideWhenZeroUnread = false;
                iconColor = "none";
                id = "NotificationHistory";
                showUnreadBadge = true;
                unreadBadgeColor = "primary";
              }
              {
                clockColor = "none";
                customFont = "";
                formatHorizontal = "h:mm AP";
                formatVertical = "hH mm AP";
                id = "Clock";
                tooltipFormat = "HH:mm ddd, MMM dd";
                useCustomFont = false;
              }
              {
                iconColor = "none";
                id = "KeepAwake";
                textColor = "none";
              }
              {
                colorizeIcons = false;
                hideMode = "hidden";
                iconScale = 0.8;
                id = "Taskbar";
                maxTaskbarWidth = 40;
                onlyActiveWorkspaces = true;
                onlySameOutput = true;
                showPinnedApps = false;
                showTitle = false;
                smartWidth = true;
                titleWidth = 120;
              }
            ];
            
            right = [
              {
                compactMode = true;
                diskPath = "/";
                iconColor = "none";
                id = "SystemMonitor";
                showCpuCores = false;
                showCpuFreq = false;
                showCpuTemp = true;
                showCpuUsage = true;
                showDiskAvailable = false;
                showDiskUsage = false;
                showDiskUsageAsPercent = false;
                showGpuTemp = true;
                showLoadAverage = false;
                showMemoryAsPercent = false;
                showMemoryUsage = true;
                showNetworkStats = false;
                showSwapUsage = false;
                textColor = "none";
                useMonospaceFont = true;
                usePadding = false;
              }
              {
                displayMode = "onhover";
                iconColor = "none";
                id = "Volume";
                middleClickCommand = "pwvucontrol || pavucontrol";
                textColor = "none";
              }
              {
                iconColor = "error";
                id = "SessionMenu";
              }
            ];
          };
          
          mouseWheelAction = "none";
          reverseScroll = false;
          mouseWheelWrap = true;
          middleClickAction = "none";
          middleClickFollowMouse = false;
          middleClickCommand = "";
          rightClickAction = "controlCenter";
          rightClickFollowMouse = true;
          rightClickCommand = "";
          screenOverrides = [ ];
        };
        
        general = {
          avatarImage = "~/Pictures/risingtide_logo.png";
          dimmerOpacity = 0.2;
          showScreenCorners = false;
          forceBlackScreenCorners = false;
          scaleRatio = 1;
          radiusRatio = 1;
          iRadiusRatio = 1;
          boxRadiusRatio = 1;
          screenRadiusRatio = 1;
          animationSpeed = 1;
          animationDisabled = false;
          compactLockScreen = false;
          lockScreenAnimations = false;
          lockOnSuspend = true;
          showSessionButtonsOnLockScreen = true;
          showHibernateOnLockScreen = false;
          enableLockScreenMediaControls = false;
          enableShadows = true;
          enableBlurBehind = true;
          shadowDirection = "bottom_right";
          shadowOffsetX = 2;
          shadowOffsetY = 3;
          language = "";
          allowPanelsOnScreenWithoutBar = true;
          showChangelogOnStartup = true;
          telemetryEnabled = false;
          enableLockScreenCountdown = true;
          lockScreenCountdownDuration = 10000;
          autoStartAuth = false;
          allowPasswordWithFprintd = false;
          clockStyle = "custom";
          clockFormat = "hh\\nmm";
          passwordChars = false;
          lockScreenMonitors = [ ];
          lockScreenBlur = 0.1;
          lockScreenTint = 0;
          
          keybinds = {
            keyUp = [ "Up" ];
            keyDown = [ "Down" ];
            keyLeft = [ "Left" ];
            keyRight = [ "Right" ];
            keyEnter = [ "Return" "Enter" ];
            keyEscape = [ "Esc" ];
            keyRemove = [ "Del" ];
          };
          
          reverseScroll = false;
        };
        
        ui = {
          fontDefault = "";
          fontFixed = "";
          fontDefaultScale = 1;
          fontFixedScale = 1;
          tooltipsEnabled = true;
          boxBorderEnabled = false;
          panelBackgroundOpacity = 0.93;
          panelsAttachedToBar = true;
          settingsPanelMode = "attached";
          settingsPanelSideBarCardStyle = false;
        };
        
        location = {
          name = "Detroit, Michigan, United States";
          weatherEnabled = true;
          weatherShowEffects = true;
          useFahrenheit = true;
          use12hourFormat = true;
          showWeekNumberInCalendar = false;
          showCalendarEvents = true;
          showCalendarWeather = true;
          analogClockInCalendar = false;
          firstDayOfWeek = -1;
          hideWeatherTimezone = false;
          hideWeatherCityName = false;
        };
        
        calendar = {
          cards = [
            {
              enabled = true;
              id = "calendar-header-card";
            }
            {
              enabled = true;
              id = "calendar-month-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
          ];
        };
        
        wallpaper = {
          enabled = true;
          overviewEnabled = false;
          directory = "~/Pictures/wallpapers";
          monitorDirectories = [ ];
          enableMultiMonitorDirectories = false;
          showHiddenFiles = false;
          viewMode = "recursive";
          setWallpaperOnAllMonitors = true;
          fillMode = "crop";
          fillColor = "#000000";
          useSolidColor = false;
          solidColor = "#1a1a2e";
          automationEnabled = false;
          wallpaperChangeMode = "random";
          randomIntervalSec = 300;
          transitionDuration = 1500;
          transitionType = "random";
          skipStartupTransition = false;
          transitionEdgeSmoothness = 0.05;
          panelPosition = "follow_bar";
          hideWallpaperFilenames = false;
          overviewBlur = 0.4;
          overviewTint = 0.6;
          useWallhaven = false;
          wallhavenQuery = "";
          wallhavenSorting = "relevance";
          wallhavenOrder = "desc";
          wallhavenCategories = "111";
          wallhavenPurity = "100";
          wallhavenRatios = "";
          wallhavenApiKey = "";
          wallhavenResolutionMode = "atleast";
          wallhavenResolutionWidth = "";
          wallhavenResolutionHeight = "";
          sortOrder = "name";
          favorites = [ ];
        };
        
        appLauncher = {
          enableClipboardHistory = false;
          autoPasteClipboard = false;
          enableClipPreview = true;
          clipboardWrapText = true;
          clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
          clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
          position = "center";
          pinnedApps = [ ];
          useApp2Unit = false;
          sortByMostUsed = true;
          terminalCommand = "kitty -e";
          customLaunchPrefixEnabled = false;
          customLaunchPrefix = "";
          viewMode = "list";
          showCategories = true;
          iconMode = "native";
          showIconBackground = false;
          enableSettingsSearch = true;
          enableWindowsSearch = true;
          enableSessionSearch = true;
          ignoreMouseInput = false;
          screenshotAnnotationTool = "";
          overviewLayer = false;
          density = "default";
        };
        
        controlCenter = {
          position = "close_to_bar_button";
          diskPath = "/";
          shortcuts = {
            left = [
              { id = "Network"; }
              { id = "Bluetooth"; }
              { id = "WallpaperSelector"; }
            ];
            right = [
              { id = "Notifications"; }
              { id = "PowerProfile"; }
              { id = "KeepAwake"; }
              { id = "NightLight"; }
            ];
          };
          cards = [
            { enabled = true; id = "profile-card"; }
            { enabled = true; id = "shortcuts-card"; }
            { enabled = true; id = "audio-card"; }
            { enabled = false; id = "brightness-card"; }
            { enabled = true; id = "weather-card"; }
            { enabled = true; id = "media-sysmon-card"; }
          ];
        };
        
        systemMonitor = {
          cpuWarningThreshold = 80;
          cpuCriticalThreshold = 90;
          tempWarningThreshold = 80;
          tempCriticalThreshold = 90;
          gpuWarningThreshold = 80;
          gpuCriticalThreshold = 90;
          memWarningThreshold = 80;
          memCriticalThreshold = 90;
          swapWarningThreshold = 80;
          swapCriticalThreshold = 90;
          diskWarningThreshold = 80;
          diskCriticalThreshold = 90;
          diskAvailWarningThreshold = 20;
          diskAvailCriticalThreshold = 10;
          batteryWarningThreshold = 20;
          batteryCriticalThreshold = 5;
          enableDgpuMonitoring = true;
          useCustomColors = false;
          warningColor = "";
          criticalColor = "";
          externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
        };
        
        noctaliaPerformance = {
          disableWallpaper = true;
          disableDesktopWidgets = true;
        };
        
        dock = {
          enabled = true;
          position = "bottom";
          displayMode = "auto_hide";
          dockType = "floating";
          backgroundOpacity = 1;
          floatingRatio = 1;
          size = 1;
          onlySameOutput = true;
          monitors = [ "HDMI-A-1" ];
          pinnedApps = [ ];
          colorizeIcons = false;
          showLauncherIcon = false;
          launcherPosition = "end";
          launcherIconColor = "none";
          pinnedStatic = false;
          inactiveIndicators = false;
          groupApps = false;
          groupContextMenuMode = "extended";
          groupClickAction = "cycle";
          groupIndicatorStyle = "dots";
          deadOpacity = 0.6;
          animationSpeed = 1;
          sitOnFrame = false;
          showDockIndicator = false;
          indicatorThickness = 3;
          indicatorColor = "primary";
          indicatorOpacity = 0.6;
        };
        
        network = {
          wifiEnabled = true;
          airplaneModeEnabled = false;
          bluetoothRssiPollingEnabled = false;
          bluetoothRssiPollIntervalMs = 10000;
          networkPanelView = "wifi";
          wifiDetailsViewMode = "grid";
          bluetoothDetailsViewMode = "grid";
          bluetoothHideUnnamedDevices = false;
          disableDiscoverability = false;
          bluetoothAutoConnect = true;
        };
        
        sessionMenu = {
          enableCountdown = false;
          countdownDuration = 10000;
          position = "center";
          showHeader = true;
          showKeybinds = true;
          largeButtonsStyle = false;
          largeButtonsLayout = "grid";
          powerOptions = [
            { action = "lock"; enabled = true; keybind = "1"; }
            { action = "suspend"; enabled = true; keybind = "2"; }
            { action = "hibernate"; enabled = true; keybind = "3"; }
            { action = "reboot"; enabled = true; keybind = "4"; }
            { action = "logout"; enabled = true; keybind = "5"; }
            { action = "shutdown"; enabled = true; keybind = "6"; }
          ];
        };
        
        notifications = {
          enabled = true;
          enableMarkdown = false;
          density = "default";
          monitors = [ "HDMI-A-1" ];
          location = "top_right";
          overlayLayer = true;
          backgroundOpacity = 1;
          respectExpireTimeout = false;
          lowUrgencyDuration = 3;
          normalUrgencyDuration = 8;
          criticalUrgencyDuration = 15;
          clearDismissed = true;
          
          saveToHistory = {
            low = true;
            normal = true;
            critical = true;
          };
          
          sounds = {
            enabled = true;
            volume = 0.5;
            separateSounds = true;
            criticalSoundFile = "";
            normalSoundFile = "";
            lowSoundFile = "";
            excludedApps = "discord,firefox,chrome,chromium,edge,vesktop,Vesktop";
          };
          
          enableMediaToast = false;
          enableKeyboardLayoutToast = true;
          enableBatteryToast = true;
        };
        
        osd = {
          enabled = true;
          location = "top_right";
          autoHideMs = 2000;
          overlayLayer = true;
          backgroundOpacity = 1;
          enabledTypes = [ 0 1 2 ];
          monitors = [ "HDMI-A-1" ];
        };
        
        audio = {
          volumeStep = 5;
          volumeOverdrive = false;
          spectrumFrameRate = 30;
          visualizerType = "linear";
          mprisBlacklist = [ ];
          preferredPlayer = "pear-desktop";
          volumeFeedback = false;
          volumeFeedbackSoundFile = "";
        };
        
        brightness = {
          brightnessStep = 5;
          enforceMinimum = true;
          enableDdcSupport = false;
          backlightDeviceMappings = [ ];
        };
        
        colorSchemes = {
          useWallpaperColors = true;
          predefinedScheme = "Noctalia (default)";
          darkMode = true;
          schedulingMode = "off";
          manualSunrise = "06:30";
          manualSunset = "18:30";
          generationMethod = "tonal-spot";
          monitorForColors = "";
        };
        
        templates = {
          activeTemplates = [
            { enabled = true; id = "gtk"; }
            { enabled = true; id = "qt"; }
            { enabled = true; id = "kitty"; }
            { enabled = true; id = "discord"; }
            { enabled = true; id = "code"; }
            { enabled = true; id = "hyprland"; }
          ];
          enableUserTheming = true;
        };
        
        nightLight = {
          enabled = true;
          forced = false;
          autoSchedule = true;
          nightTemp = "4000";
          dayTemp = "6500";
          manualSunrise = "06:30";
          manualSunset = "18:30";
        };
        
        hooks = {
          enabled = true;
          wallpaperChange = "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' && gsettings set org.gnome.desktop.interface gtk-theme 'Colloid-Dark'";
          darkModeChange = "";
          screenLock = "";
          screenUnlock = "";
          performanceModeEnabled = "";
          performanceModeDisabled = "";
          startup = "";
          session = "";
        };
        
        plugins = {
          autoUpdate = false;
        };
        
        idle = {
          enabled = true;
          screenOffTimeout = 600;
          lockTimeout = 660;
          suspendTimeout = 0;
          fadeDuration = 5;
          screenOffCommand = "hyprctl dispatch dpms off";
          lockCommand = "noctalia-shell ipc call lockScreen lock";
          suspendCommand = "";
          resumeScreenOffCommand = "hyprctl dispatch dpms on";
          resumeLockCommand = "";
          resumeSuspendCommand = "";
          customCommands = "[{\"name\":\"Toggle keyboard lights\",\"timeout\":60,\"command\":\"solaar config \\\"G815 Mechanical Keyboard\\\" brightness_control 0\",\"resumeCommand\":\"solaar config \\\"G815 Mechanical Keyboard\\\" brightness_control 100\"}]";
        };
        
        desktopWidgets = {
          enabled = true;
          overviewEnabled = true;
          gridSnap = false;
          monitorWidgets = [
            {
              name = "HDMI-A-1";
              widgets = [
                {
                  hideMode = "idle";
                  id = "MediaPlayer";
                  roundedCorners = true;
                  scale = 1;
                  showAlbumArt = true;
                  showBackground = false;
                  showButtons = true;
                  showVisualizer = true;
                  visualizerType = "linear";
                  x = 1483;
                  y = 937;
                }
              ];
            }
            {
              name = "DP-1";
              widgets = [ ];
            }
          ];
        };
      };
    };
}