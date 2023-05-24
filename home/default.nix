{ config, pkgs, ... }:

{
	imports = [
		./bspwm.nix
		./fcitx5.nix
		# ./display.nix
	];

	home = {
		username = "rqdmap";
		homeDirectory = "/home/rqdmap";
		stateVersion = "22.11";

		# file.".config/bspwm/bspwmrc" = {
		# 	executable = true;
		# 	source = ./.config/bspwm/bspwmrc;
		# };

		# file.".config/sxhkd/sxhkdrc" = {
		# 	executable = true;
		# 	source = ./.config/sxhkd/sxhkdrc;
		# };

		file.".config/polybar/" = {
			source = ./.config/polybar;
			recursive = true;
		};

		file.".config/rofi/" = {
			source = ./.config/rofi;
			recursive = true;
		};

		file.".config/picom/" = {
			source = ./.config/picom;
			recursive = true;
		};

		file.".config/clash/" = {
			source = ./.config/clash;
			recursive = true;
		};

		file.".config/alacritty/" = {
			source = ./.config/alacritty;
			recursive = true;
		};

		file.".zshrc" = {
			source = ./.config/zsh/.zshrc;
		};

		file.".zlogin" = {
			source = ./.config/zsh/.zlogin;
		};

		file.".config/starship.toml" = {
			source = ./.config/starship.toml;
		};

		file.".config/nvim" = {
			source = ./.config/nvim;
			recursive = true;
		};

		file.".config/fontconfig" = {
			source = ./.config/fontconfig;
			recursive = true;
		};

		file.".config/htop" = {
			source = ./.config/htop;
			recursive = true;
		};

		# file.".config/fcitx5" = {
		# 	source = ./.config/fcitx5;
		# 	recursive = true;
		# };


		file.".Xresources" = {
			source = ./.Xresources;
		};
		
		### Local
		file.".local/bin" = {
			source = ./.local/bin;
			recursive = true;
		};
	};
	programs = {
		neovim = {
			plugins = [
				pkgs.vimPlugins.nvim-treesitter
			];
		};
		home-manager.path = "$HOME/.local/bin";
	};
}
