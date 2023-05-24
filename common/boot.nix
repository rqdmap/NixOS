{ config, lib, pkgs, modulesPath, ... }:

{
	imports = [
	  (modulesPath + "/installer/scan/not-detected.nix")
	];

	boot = {
		loader.systemd-boot.enable = true;
		loader.efi.canTouchEfiVariables = true;

		initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "usbhid" "sd_mod" ];
		initrd.kernelModules = [ ];

		# kernelParams = ["nomodeset"];
		kernelModules = [ "i915.force_probe=46a6" ];
		extraModulePackages = [ ];
	};

	fileSystems."/boot" = {
		device = "/dev/disk/by-uuid/48A2-F7D3";
		fsType = "vfat";
	};

	fileSystems."/" = {
		device = "/dev/disk/by-uuid/d12a4d59-9870-4323-aaa1-fc6c01dd5f65";
		fsType = "ext4";
	};


	fileSystems."/mnt" = {
		device = "/dev/disk/by-uuid/01293c28-17d2-4c64-abfc-9c72a0982db4";
		fsType = "ext4";
	};
	swapDevices = [{
		device = "/dev/disk/by-uuid/355a164d-9d7c-4056-b7f1-fcb3224c32fd";
	}];
}
