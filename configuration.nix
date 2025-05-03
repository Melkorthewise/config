{ config, pkgs, ... }:

{

  imports = [ ./hardware-configuration.nix ];
  
  programs.hyprland.enable = true;
  programs.home-manager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.supportedLocales = [ "en_GB.UTF-8/UTF-8" "nl_NL.UTF-8/UTF-8" ];

  i18n.extraLocaleSettings = {
    LC_NUMERIC		= "nl_NL.UTF-8";
    LC_TIME		= "nl_NL.UTF-8";
    LC_MONETARY		= "nl_NL.UTF-8";
    LC_MEASUREMENT	= "nl_NL.UTF-8";
    LC_ADDRESS		= "nl_NL.UTF-8";
    LC_IDENTIFICATION	= "nl_NL.UTF-8";
    LC_NAME		= "nl_NL.UTF-8";
    LC_TELEPHONE	= "nl_NL.UTF-8";
    LC_PAPER		= "nl_NL.UTF-8";
    LC_COLLATE		= "nl_NL.UTF-8";
    LC_MESSAGES		= "en_GB.UTF-8";
  };

  time.timeZone = "Europe/Amsterdam";

  programs.hyprland.xwayland.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;

  users.users.tdmunnik = {
    isNormalUser = true;
    description = "Thomas de Munnik";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    kitty
    wofi
    firefox
    waybar
    hyprpaper
    hyprlock
    hyprsunset
    git
    spotify
    obsidian
    discord
    unzip
    playerctl
    nautilus
    pipewire
    steam
    mako
    pavucontrol
    go
    home-manager
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.blueman.enable = true;

  programs.ssh.startAgent = true;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    # optionally: withNodeJs = true; # if you want extra plugins working
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "Iosevka" ]; })
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  system.stateVersion = "24.11";

} 
