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
    ./modules/waybar.nix
  ];

  programs.bash.shellAliases = {
    vim = "nvim";
  };

  programs.git = {
    enable = true;
    userName = "Melkorthewise";
    userEmail = "thomasdemunnik05@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nvim";
      color.ui = true;
      push.autoSetupRemote = true;
    };
  };
}
