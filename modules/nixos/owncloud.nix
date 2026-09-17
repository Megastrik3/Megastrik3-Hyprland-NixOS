# Modules for ownCloud Infinite Scale (OCIS) rclone virtual mount and offline sync

{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.owncloud-sync;

  # Helper script to run bisync safely:
  # - Resolves %h or relative paths using user home directory
  # - Supports remote folder named either "OU_Fall_2026" or "OU Fall 2026"
  # - Automatically runs initial --resync if listing cache doesn't exist yet
  # - Uses --resilient and --recover for reliable periodic runs
  bisyncScript = pkgs.writeShellScript "ocis-offline-bisync" ''
    set -euo pipefail

    HOME_DIR="''${1:-$HOME}"
    LOCAL_DIR="${cfg.offlineSyncDir}"
    LOCAL_DIR="''${LOCAL_DIR//%h/$HOME_DIR}"
    mkdir -p "$LOCAL_DIR"

    REMOTE_NAME="${cfg.remote}"
    REMOTE_PATH="${cfg.offlineRemoteDir}"

    # Auto-detect whether remote folder uses spaces or underscores
    if ! ${pkgs.rclone}/bin/rclone lsd "$REMOTE_NAME:$REMOTE_PATH" >/dev/null 2>&1; then
      ALT_PATH="''${REMOTE_PATH//_/ }"
      if ${pkgs.rclone}/bin/rclone lsd "$REMOTE_NAME:$ALT_PATH" >/dev/null 2>&1; then
        REMOTE_PATH="$ALT_PATH"
      fi
    fi

    echo "Synchronizing $REMOTE_NAME:$REMOTE_PATH with $LOCAL_DIR..."

    # Run bisync with resilience and recovery flags
    if ! ${pkgs.rclone}/bin/rclone bisync "$REMOTE_NAME:$REMOTE_PATH" "$LOCAL_DIR" \
      --create-empty-src-dirs \
      --compare size,modtime \
      --resilient \
      --recover; then
      STATUS=$?
      # Exit code 7 indicates bisync listing cache is missing, requiring initial --resync
      if [ $STATUS -eq 7 ]; then
        echo "Bisync listing cache missing or interrupted. Running initial --resync..."
        ${pkgs.rclone}/bin/rclone bisync "$REMOTE_NAME:$REMOTE_PATH" "$LOCAL_DIR" \
          --create-empty-src-dirs \
          --compare size,modtime \
          --resync
      else
        exit $STATUS
      fi
    fi
  '';
in
{
  options.services.owncloud-sync = {
    enable = mkEnableOption "ownCloud Infinite Scale rclone VFS mount and offline sync";

    remote = mkOption {
      type = types.str;
      default = "ocis";
      description = "The rclone remote name configured in ~/.config/rclone/rclone.conf (e.g. ocis or owncloud)";
    };

    mountPoint = mkOption {
      type = types.str;
      default = "%h/owncloud";
      description = "Local directory for the virtual streaming VFS mount";
    };

    offlineSyncDir = mkOption {
      type = types.str;
      default = "%h/SSD_Drive/OU_Fall_2026/Course_Data";
      description = "Local directory for offline synced files";
    };

    offlineRemoteDir = mkOption {
      type = types.str;
      default = "OU_Fall_2026";
      description = "Remote directory on ownCloud to sync offline (auto-matches space-separated directory if needed)";
    };
  };

  config = mkIf cfg.enable {
    # Virtual mount for EVERYTHING (streamed on demand, bounded cache)
    systemd.user.services.ocis-vfs = {
      description = "Virtual filesystem mount for ownCloud Infinite Scale";
      wantedBy = [ "default.target" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      path = [ "/run/wrappers" ];
      serviceConfig = {
        Type = "notify";
        ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${cfg.mountPoint}";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone mount ${cfg.remote}: ${cfg.mountPoint} \
            --vfs-cache-mode full \
            --vfs-cache-max-size 15G \
            --vfs-cache-max-age 24h \
            --dir-cache-time 1m
        '';
        ExecStop = "-/run/wrappers/bin/fusermount -u ${cfg.mountPoint}";
        Restart = "on-failure";
        RestartSec = "10s";
      };
    };

    # Explicit offline bi-directional sync for selected directories
    systemd.user.services.ocis-offline-sync = {
      description = "Bi-directional sync for critical offline folders";
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      path = [ "/run/wrappers" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${bisyncScript} %h";
      };
    };

    # Run the offline sync every 15 minutes
    systemd.user.timers.ocis-offline-sync = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "2m";
        OnUnitActiveSec = "15m";
      };
    };
  };
}
