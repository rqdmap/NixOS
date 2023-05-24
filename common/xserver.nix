{ config, pkgs, lib, ... }:

{
	nixpkgs.config.allowUnfree = true;
	services = {
		xserver = {
			enable = true;
			windowManager.bspwm = {
				enable = true;
			};
			displayManager.sddm.enable = true;
			videoDrivers = [ "intel" "nvidia" ];
		};
		picom.vSync = true;
	};

	# hardware.nvidiaOptimus.disable = true;
	hardware.nvidia = {
		modesetting.enable = true;
		# open = true;
	};
}
