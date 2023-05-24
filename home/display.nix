{ 
	programs.autorandr = {
		enable = true;
		profiles = {
			"G417" = {
				fingerprint = {
					eDP-1 = "";
					HDMI-1-1 = "";
				};
				config = {
						eDP-1 = {
								enable = true;
								mode = "1920x1080";
								rate = "165.01";
						};
						HDMI-1-1 = {
								enable = true;
								mode = "2560x1080";
								rate = "74.99";
								primary = true;
						};
				};
			};
		};
	};
}
