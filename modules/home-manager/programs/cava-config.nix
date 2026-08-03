{ config, pkgs, ... }:

{
  programs.cava = {
    enable = true;
    settings = {
      input = {
        method = "pipewire";
        source = "auto";
      };
      color = {
        gradient = 1;
        gradient_count = 8;
        gradient_color_1 = "'#4E4E4E'";
        gradient_color_2 = "'#626262'";
        gradient_color_3 = "'#6D6D6D'";
        gradient_color_4 = "'#A9A9A9'";
        gradient_color_5 = "'#F0F0F0'";
        gradient_color_6 = "'#D6D6D6'";
        gradient_color_7 = "'#E2E2E2'";
        gradient_color_8 = "'#F0F0F0'";
      };
    };
  };
}
