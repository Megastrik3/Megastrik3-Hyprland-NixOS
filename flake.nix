{
  description = "Megastrik3's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      # Follow corresponding `release` branch from Home Manager
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes";
    grub2-themes = {
      url = "github:vinceliuice/grub2-themes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixpkgs-r2modman.url = "github:nixos/nixpkgs/1cbe6ab531cb26bfd78a9783f71404d38846ed8c";
  };

  outputs =
    inputs@{ self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      username = "hudsonb";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      # === ADDED ===
      # Create a separate pkgs instance specifically for CUDA packages.
      # This avoids rebuilding your entire system with cudaSupport = true.
      pkgs-cuda = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          cudaSupport = true;
        };
      };
      # === END ADDED ===

      # Helper function to generate host configurations
      mkHost = host: nixpkgs.lib.nixosSystem rec {
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit username;
          inherit host;
          inherit pkgs-cuda; # <-- Pass the CUDA-enabled pkgs instance here
        };
        modules = [
          ./hosts/${host}/config.nix
          ./modules/nixos/quickshell.nix
          home-manager.nixosModules.home-manager
          {
          home-manager.backupFileExtension = "hm-bak";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs username; };
          home-manager.users."${username}" = ./hosts/${host}/home.nix;
          }

          # Import the overlays from the new file
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ (import ./overlays) ];
          })
        ];
      };

    in
    {
      nixosConfigurations = {
        centari = mkHost "centari";
        voyager = mkHost "voyager";
      };
    };
}