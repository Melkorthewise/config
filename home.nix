{ config, pkgs, ... }: {
  home.username = "tdmunnik";
  home.homeDirectory = "/home/tdmunnik";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neovim
    kitty
    waybar
    dunst
  ];

  imports = [
    ./modules/hyprland.nix
  ];
}
