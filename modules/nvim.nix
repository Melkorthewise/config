{ config, pkgs, ... }: {

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    withPython3 = true;
  };

  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
}
