{ config, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = "VGA-1,preffered,auto,1";
      exec-once = [ "kitty" ];
      input.kb_layout = "us";
      general = {
        gaps_in = 5;
	gaps_out = 10;
      };
    };
  };
}
