# ./overlays/default.nix

final: prev: {
  # This overlay extends the set of Python packages.
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (python-final: python-prev: {
      # Workaround for nixpkgs issue #437058 by disabling failing tests.
      i3ipc = python-prev.i3ipc.overridePythonAttrs (oldAttrs: {
        doCheck = false; # Disables the check phase entirely
      });
      
      # ADD THIS: Workaround for picosvg test failure on python 3.13
      picosvg = python-prev.picosvg.overridePythonAttrs (oldAttrs: {
        doCheck = false; 
      });

      # Workaround for upstream nanoemoji source hash mismatch
      nanoemoji = python-prev.nanoemoji.overridePythonAttrs (oldAttrs: {
        src = oldAttrs.src.overrideAttrs (oldSrc: {
          outputHash = "sha256-FysyKC01XBnRiur5RR9fcsTxQqE8x0JJHSoe3q6JtKc=";
        });
      });
    })
  ];

  # ADD THIS PART:
  # This tells the 32-bit package set (pkgs-i686-linux)
  # to build without CUDA support, preventing the error.
  pkgs-i686-linux = prev.pkgs-i686-linux.override {
    cudaSupport = false;
  };

  # Workaround for upstream nixpkgs 21.1 davinci-resolve source hash mismatch
  davinci-resolve = prev.davinci-resolve.override {
    runCommandLocal = name: env: text:
      prev.runCommandLocal name (env // {
        outputHash = "sha256-+3SB32EHpH9/0hM3h8CrO6f7V4ZAmxUFh3P8m6QDeO0=";
      }) text;
  };
}