{ pkgs, config, lib, ... }:{

	i18n.inputMethod = {
		enabled = "fcitx5";

		fcitx5.addons = with pkgs; [
			# fcitx5-rime
			fcitx5
			fcitx5-configtool
			fcitx5-chinese-addons
			fcitx5-chinese-addons
		];
	};

	systemd.user.sessionVariables = {
		GLFW_IM_MODULE = "fcitx";
		GTK_IM_MODULE = "fcitx";
		QT_IM_MODULE = "fcitx";
		XMODIFIERS = "@im=fcitx";
		INPUT_METHOD = "fcitx";
		IMSETTINGS_MODULE  = "fcitx";
	};
}
