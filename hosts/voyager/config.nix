# Host-specific configuration for Voyager laptop/portable host

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
    ];

    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ ];
    };

    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
      };
      timeout = 5;
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

  # Host Keyboard Console Layout
  console.keyMap = "${keyboardLayout}";

  # Logitech Support
  hardware = {
    logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };
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
  };

  system.stateVersion = "25.05";
}
