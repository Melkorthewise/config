{ config, pkgs, ... }: {
  programs.waybar = {
    settings = [{
      layer = "top";
      position = "top";
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "network" "cpu" "memory" ];
      clock = {
        format = "{:%H:%M}";
        tooltup-format = "{:%A, %d %B %Y}";
      };
    }];
    style = ''
      * {
        font-family: JetBrainsMono Nerd Font, sans-serif;
        font-size: 13px;
        color: #ffffff;
      }

      window {
        background-color: #282a36;
      }
    '';
  };
}
