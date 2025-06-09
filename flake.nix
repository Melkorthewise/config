{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = inputs@{ nixpkgs, home-manager, zen-browser, ... }: let
    system = "x86_64-linux";

    zenSpecific = import ./zen-override.nix {
      inherit system;
      zenBrowserPackages = zen-browser.packages;
    };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };

      modules = [
	./configuration.nix

	# make home-manager as a module of nixos so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
	home-manager.nixosModules.home-manager {
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;

	  home-manager.users.tdmunnik = import ./home.nix {
	    pkgs = import nixpkgs {
	      system = "x86_64-linux";
	    };
	    lib = nixpkgs.lib;
            config = {};
          };
        }

        # ———————— ZEN BROWSER MODULE ————————
	# add the overridden zenSpecific into systemPackages
	({ config, pkgs, ... }: {
	  environment.systemPackages = with pkgs; [
	    zenSpecific
	  ];
	})
      ];
    };
  };
}
