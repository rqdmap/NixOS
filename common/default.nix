{ config, pkgs, lib, ... }:

{
	imports = [
		./boot.nix
		./network.nix
		./package.nix
		./xserver.nix
	];

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

	time.timeZone = "Asia/Shanghai";

	powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

	users.mutableUsers = false;
	users.users = {
		rqdmap = {
			isNormalUser = true;
			hashedPassword = "$6$DpmCNfia5NzOmtAB$cbFpHwfz9UJcatqeGPAUSrQe.pTYfEuq2ZW1mlUa4jH6PRCGeN5sgbYOvdEInfKYoZfRJkxIwP/XkEvYhSk5G.";
			extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
			createHome = true;
			shell = pkgs.zsh;
		};
	};


	system.stateVersion = "22.11"; # Did you read the comment?
}
