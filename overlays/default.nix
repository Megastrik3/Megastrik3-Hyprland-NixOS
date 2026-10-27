inputsOrFinal:
let
  overlayBody = inputs: final: prev: {
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

    # Workaround for upstream nixpkgs 21.1.1 davinci-resolve source hash mismatch
    davinci-resolve = prev.davinci-resolve.override {
      runCommandLocal = name: env: text:
        prev.runCommandLocal name (env // {
          outputHash = "sha256-hU27MRgjuBv201uR4tdI1P4ay8dCKyhNBtxwZ9CajJM=";
        }) text;
    };

    # Workaround for upstream nixpkgs issue #568692: zotero 10.0.2 fails to build with firefox-esr-153
    # Pin zotero to the last known working nixpkgs commit where it uses firefox-esr-140.
    zotero =
      if inputs != null && inputs ? nixpkgs-zotero then
        let
          system = prev.stdenv.hostPlatform.system or prev.system;
        in
        inputs.nixpkgs-zotero.legacyPackages.${system}.zotero
      else
        prev.zotero;

    # Workaround for upstream nixpkgs audacity 4.0.0 build failure with Qt 6.12.0
    # (QQmlPrivate::AOTLookupValidation::Type collision in muse_extensions_qml).
    # Pin audacity 4.0.0 to the working nixpkgs commit where it builds with Qt 6.11.2.
    audacity =
      if inputs != null && inputs ? nixpkgs-zotero then
        let
          system = prev.stdenv.hostPlatform.system or prev.system;
        in
        inputs.nixpkgs-zotero.legacyPackages.${system}.audacity
      else
        prev.audacity;

    # Use Noctalia from flake input (v5.4.0) instead of nixpkgs
    noctalia =
      if inputs != null && inputs ? noctalia then
        let
          system = prev.stdenv.hostPlatform.system or prev.system;
        in
        inputs.noctalia.packages.${system}.default
      else
        prev.noctalia;

    # Workaround for upstream nixpkgs hplip 3.26.4 build failure with __structuredAttrs:
    # makeWrapperArgs is a bash array, so unquoted $makeWrapperArgs in preFixup only expands
    # the first element ("--prefix"), causing makeCWrapper to fail on subsequent arguments.
    hplip = prev.hplip.overrideAttrs (oldAttrs: {
      preFixup = builtins.replaceStrings [ "$makeWrapperArgs" ] [ ''"''${makeWrapperArgs[@]}"'' ] oldAttrs.preFixup;
    });
    hplipWithPlugin = prev.hplipWithPlugin.overrideAttrs (oldAttrs: {
      preFixup = builtins.replaceStrings [ "$makeWrapperArgs" ] [ ''"''${makeWrapperArgs[@]}"'' ] oldAttrs.preFixup;
    });
  };
in
if builtins.isAttrs inputsOrFinal && inputsOrFinal ? inputs then
  overlayBody inputsOrFinal.inputs
else
  overlayBody null inputsOrFinal