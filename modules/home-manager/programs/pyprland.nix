{ pkgs, ... }:
{
  home.packages = [
    pkgs.pyprland
  ];

  xdg.configFile."pypr/config.toml".text = ''
    [pyprland]
    plugins = ["scratchpads"]

    [scratchpads.term]
    animation = "fromTop"
    command = "kitty --class kitty-dropterm -o remember_window_size=no"
    class = "kitty-dropterm"
    match_by = "class"
    size = "68% 42%"
    position = "16% 6%"
    lazy = true

    [scratchpads.music]
    animation = "fromRight"
    command = "pear-desktop"
    class = "com.github.th-ch.youtube-music"
    match_by = "class"
    size = "28% 80%"
    position = "70% 13%"
    lazy = true
    process_tracking = false

    [scratchpads.bitwarden]
    animation = "fromLeft"
    command = "bitwarden"
    class = "bitwarden"
    match_by = "class"
    size = "28% 80%"
    position = "2% 13%"
    lazy = true
    process_tracking = false
  '';
}
