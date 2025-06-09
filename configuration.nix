{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Bootloader
  boot.loader.grub = {
    enable = true;
    devices = [ "/dev/sda" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "Marvin";
  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.supportedLocales = [ "en_GB.UTF-8/UTF-8" "nl_NL.UTF-8/UTF-8" ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.displayManager.defaultSession = "hyprland";

  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    hyprland

    git
    neovim
    wget
  ];

  programs.zsh.enable = true;
  users.users.tdmunnik = {
    isNormalUser = true;
    description = "Thomas";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" ];
  };
  
  services.openssh.enable = true;

  users.users.tdmunnik.openssh.authorizedKeys.keys = [
    #ssh-key
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11";
}
