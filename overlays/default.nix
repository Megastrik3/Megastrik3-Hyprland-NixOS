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

  # Workaround for Blackmagic Design downloads.json 502 Bad Gateway error
  davinci-resolve = prev.davinci-resolve.override {
    runCommandLocal = name: env: text:
      prev.runCommandLocal name env (
        builtins.replaceStrings
          [
            ''
            DOWNLOADID=$(
              curl --silent --compressed "$DOWNLOADSURL" \
                | jq --raw-output '.downloads[] | .urls.Linux?[]? | select(.downloadTitle | test("^'"$PRODUCT $VERSION"'( Update)?$")) | .downloadId'
            )''
          ]
          [
            ''
            DOWNLOADID="651bbe286f4c4544b4ded9b343638f60"
            if [ "$PRODUCT" = "DaVinci Resolve Studio" ]; then
              DOWNLOADID="f6af677f3e3741f59a014b54445bd39e"
            fi''
          ]
          text
      );
  };

  davinci-resolve-studio = prev.davinci-resolve-studio.override {
    runCommandLocal = name: env: text:
      prev.runCommandLocal name env (
        builtins.replaceStrings
          [
            ''
            DOWNLOADID=$(
              curl --silent --compressed "$DOWNLOADSURL" \
                | jq --raw-output '.downloads[] | .urls.Linux?[]? | select(.downloadTitle | test("^'"$PRODUCT $VERSION"'( Update)?$")) | .downloadId'
            )''
          ]
          [
            ''
            DOWNLOADID="651bbe286f4c4544b4ded9b343638f60"
            if [ "$PRODUCT" = "DaVinci Resolve Studio" ]; then
              DOWNLOADID="f6af677f3e3741f59a014b54445bd39e"
            fi''
          ]
          text
      );
  };
}