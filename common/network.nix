{ config, pkgs, lib, ... }:

{
	networking = {
		# Enables DHCP on each ethernet and wireless interface. In case of scripted networking
		# (the default) this is the recommended approach. When using systemd-networkd it's
		# still possible to use this option, but it's recommended to use it in conjunction
		# with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
		useDHCP = lib.mkDefault true;

		# networking.interfaces.enp59s0.useDHCP = lib.mkDefault true;
		# networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;
		hostName = "nixos";
		networkmanager.enable = true;

		proxy.default = "http://127.0.0.1:7890/";
		proxy.noProxy = "localhost,127.0.0.0/8,10.0.0.0/8";



		firewall.enable = false;
	};

}
