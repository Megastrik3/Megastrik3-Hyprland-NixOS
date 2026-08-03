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
    })
  ];

  # ADD THIS PART:
  # This tells the 32-bit package set (pkgs-i686-linux)
  # to build without CUDA support, preventing the error.
  pkgs-i686-linux = prev.pkgs-i686-linux.override {
    cudaSupport = false;
  };
}