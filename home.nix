{ config, pkgs, ... }:

{
  home.username = "tdmunnik";
  home.homeDirectory = "/home/tdmunnik";

  programs.home-manager.enable = true;

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    ripgrep
  ];

  programs.git = {
    enable = true;
    userName  = "Melkorthewise";
    userEmail = "thomasdemunnik05@gmail.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
    
    '';

    shellAliases = {
      vim = "nvim";
    };
  };

  home.stateVersion = "24.11";

}
