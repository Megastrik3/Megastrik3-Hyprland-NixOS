# Host-specific configuration for Centari workstation

{ config, pkgs, host, username, options, lib, inputs, system, ... }:

let
  inherit (import ./variables.nix) keyboardLayout;
in
{
  imports = [
    ./hardware.nix
    ./users.nix
    ./sddm.nix
    ../../modules/nixos/core.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/amd-drivers.nix
    ../../modules/nixos/nvidia-drivers.nix
    ../../modules/nixos/nvidia-prime-drivers.nix
    ../../modules/nixos/intel-drivers.nix
    ../../modules/nixos/vm-guest-services.nix
    ../../modules/nixos/local-hardware-clock.nix
    ../../modules/nixos/owncloud.nix
    inputs.grub2-themes.nixosModules.default
  ];

  # Host Identification & Networking
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
  };

  # Host Bootloader & Kernel Configuration
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    kernelParams = [
      "systemd.mask=systemd-vconsole-setup.service"
      "systemd.mask=dev-tpmrm0.device"
      "nowatchdog"
      "modprobe.blacklist=sp5100_tco"
      "modprobe.blacklist=iTCO_wdt"
      "amd_iommu=on"
      "iommu=pt"
      "vfio-pci.ids=10de:1401,10de:0fba"
    ];

    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" "vfio_pci" "vfio" "vfio_iommu_type1" ];
      kernelModules = [ ];
    };

    loader = {
      systemd-boot.enable = false;
      efi = {
        canTouchEfiVariables = true;
      };
      timeout = 5;
      grub2-theme = {
        enable = true;
        theme = "tela";
        icon = "color";
        screen = "1080p";
      };
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        memtest86.enable = true;
        extraGrubInstallArgs = [ "--bootloader-id=${host}" ];
        configurationName = "${host}";
      };
    };

    tmp = {
      useTmpfs = false;
      tmpfsSize = "30%";
    };

    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };

    plymouth.enable = true;
  };

  # Host GPU Drivers & Hardware Setup
  drivers = {
    amdgpu.enable = true;
    intel.enable = true;
    nvidia.enable = true;
    nvidia-prime = {
      enable = false;
      intelBusID = "";
      nvidiaBusID = "";
    };
  };

  vm.guest-services.enable = false;
  local.hardware-clock.enable = true;

  # Host-Specific Services
  services.code-server.enable = true;
  services.owncloud-sync = {
    enable = true;
    offlineSyncDir = "%h/SSD_Drive/OU_Fall_2026/Course_Data";
  };

  # Syncthing configuration (disabled)
  # services.syncthing = {
  #   enable = false;
  #   dataDir = "/home/hudsonb";    # Default is /var/lib/syncthing
  #   configDir = "/home/hudsonb/.config/syncthing"; # Optional: Explicitly set config location
  #   openDefaultPorts = true;
  #   overrideDevices = false;
  #   overrideFolders = false;
  #   guiAddress = "127.0.0.1:8384";
  #   user = "hudsonb";
  #   group = "users";
  #   # Optional: GUI credentials (can be set in the browser instead)
  #   settings.gui = {
  #     user = "centari";
  #     password = "password";
  #     apikey = "197920b7c60142f1a837ed26dc916c3255c243b90200e0bcec98d6e80683bb4b";
  #   };
  #   settings = {
  #     options.relaysEnabled = false;
  #     options.urAccepted = -1;
  #     options.globalAnnounceEnabled = false; # Disables "Global Discovery"
  #     options.natEnabled = false;            # Disables "Enable NAT Traversal"
  #   };
  # };

  # Host Keyboard Console Layout
  console.keyMap = "${keyboardLayout}";

  programs.solaar.enable = true;

  # Logitech & Xbox Controller Support
  hardware = {
    logitech.wireless.enable = true;
    xone.enable = true;
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
      blacklistedKernelModules = [ "hid-uclogic" "wacom" ];
    };
    graphics.enable = true;
  };

  # Virtualization & Containers
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
    podman = {
      enable = false;
      dockerCompat = false;
      defaultNetwork.settings.dns_enabled = false;
    };
    spiceUSBRedirection.enable = true;
  };

  # Permitted Insecure Packages Workaround
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
    "pnpm-10.29.2"
  ];

  system.stateVersion = "25.05";
}
