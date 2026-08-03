{ pkgs }:

[
  (pkgs.callPackage ./nix-RainbowBorders.nix { })
  (pkgs.callPackage ./nix-RofiBeats.nix { })
  (pkgs.callPackage ./nix-RofiCalc.nix { })
  (pkgs.callPackage ./nix-Tak0-Autodispatch.nix { })
  (pkgs.callPackage ./nix-WallpaperAutoChange.nix { })
  (pkgs.callPackage ./nix-WallpaperEffects.nix { })
  (pkgs.callPackage ./nix-WallpaperRandom.nix { })
  (pkgs.callPackage ./nix-WallpaperSelect.nix { })
  (pkgs.callPackage ./nix-Weather.nix { })
  (pkgs.callPackage ./nix-WeatherWrap.nix { })
  (pkgs.callPackage ./nix-ZshChangeTheme.nix { })
]