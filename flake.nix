#! ~/nix-config/flake.nix
{
  description = "My NixOS with Hyprland and Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, zen-browser, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
	      config.allowUnfree = true;
      };
      zenSpecific = import ./zen-override.nix {
        inherit system;
        zenBrowserPackages = zen-browser.packages;
      };
    in {
      nixosConfigurations.Marvin = nixpkgs.lib.nixosSystem {
        inherit system;
	      modules = [
	        ./configuration.nix
	        home-manager.nixosModules.home-manager
	        {
	          home-manager.useGlobalPkgs = true;
	          home-manager.useUserPackages = true;
	          home-manager.users.tdmunnik = import ./home.nix;
	        }

          # === ZEN BROWSER MODULE ===
          ({ config, pkgs, ... }: {
            environment.systemPackages = with pkgs; [
              zenSpecific
            ];
          })
	      ];
      };
    };
}
