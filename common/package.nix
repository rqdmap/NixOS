{ config, pkgs, ... }:

{
	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [
		# X Server & Driver
		xorg.xf86videonouveau
		mesa

		# Desktop
		bspwm
		sxhkd
		polybar
		picom
		rofi

		# System Manage & Basic Utils
		pciutils
		htop
		unzip
		wget
		git
		tree
		xclip
		xsecurelock
		alsa-utils
		light

		# Softwares
		# ly
		flameshot
		ripgrep
		fd
		alacritty
		zsh
		starship
		neovim
		clash
		fzf
		neofetch
		google-chrome
		feh
		ranger
		telegram-desktop


		# Develop
		python3 python3.pkgs.pip
		jdk
		nodejs
		gcc
		rustup
		go
	];

	fonts.fonts = with pkgs; [
		iosevka
		nerdfonts
		source-han-sans
		wqy_microhei
	];

	programs = {
		neovim = {
			enable = true;
			defaultEditor = true;
			vimAlias = true;
		};

		zsh.enable = true;
	};

}
