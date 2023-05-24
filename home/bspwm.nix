{ config, pkgs, ... }:

{
	services.sxhkd = {
		enable = true;
		keybindings = {
			"control + alt + t" = "alacritty";
			"alt + @space" = "flameshot gui";
			"alt + Return" = "/home/rqdmap/.config/rofi/rofi_run";
			"control + alt + l" = "xsecurelock";
			"super + alt + Escape" = "pkill -USR1 -x sxhkd";
			"XF86MonBrightnessUp" = "light -As sysfs/backlight/nvidia_wmi_ec_backlight 10";
			"XF86MonBrightnessDown" = "light -Us sysfs/backlight/nvidia_wmi_ec_backlight 10";
			"XF86AudioRaiseVolume" = "amixer -c 1 set Master 5%+";
			"XF86AudioLowerVolume" = "amixer -c 1 set Master 5%-";
			"XF86AudioMute" = "amixer -c 1 set Master on";
			"Print" = "flameshot full";
			"Pause" = "record -k -r";
			"shift + Pause" = "record -k -f";
			# "Scroll_Lock" = "flameshot full";
			"super + alt + r" = "bspc wm -r";
			"super + {_,shift + }w" = "bspc node -{c,k}";
			"super + g" = "bspc node -s biggest.local";
			"super + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
			"super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
			"super + {_,shift + }{1-9,0,minus}" = "bspc {desktop -f,node -d} '^{1-9,10,11}'";
			"super + alt + {h,j,k,l}" = "bspc node -p {west,south,north,east}";
			"super + alt + {1-9}" = "bspc node -o 0.{1-9}";
			"super + alt + space" = "bspc node -p cancel";
			"super + alt + shift + space" = "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel";
			"super + control + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
			"super + control + shift + {h,j,k,l}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";
			"super + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";
			"super + shift + r" = "bspc node @/ -R 90";
			"super + r" = "bspc node @parent -R 90";
			"super + v" = "bspc node -g hidden";
			"super + shift + v" = "bspc node {,$(bspc query -N -n .hidden | tail -n1)} -g hidden=off";
		};
	};
	xsession.windowManager.bspwm = {
		enable = true;
		monitors = {
			eDP-1 = [
				"-"
			];
			HDMI-1-1 = [
				"I"
				"II"
				"III"
				"IV"
				"V"
				"VI"
				"VII"
				"VIII"
				"IX"
				"X"
			];
		};

		extraConfigEarly = ''
PATH="$HOME/.local/bin/:"$PATH

both="1"
name1=$(xrandr | grep -i edp | grep -w connected  | cut -d ' ' -f 1)
rate1="165.01"
mode1="1920x1080"

name2=$(xrandr | grep -i hdmi | grep -w connected  | cut -d ' ' -f 1)
mode2="2560x1080"
rate2="74.99"

# Home AOC
# mode="1920x1080"
# rate="60"

function setMonitor(){
        xrandr --output $1 --rate $2 --mode $3
        if [[ -n $4 ]]; then
        bspc monitor $1 -d -
        else
        bspc monitor $1 -d I II III IV V VI VII VII IX X
        fi
}

function clearMonitor(){
        xrandr --output $1 --off
        bspc monitor $1 -r
}
if [ "$(xrandr | grep " connected " | grep $name2)" ]; then
        setMonitor $name2 $rate2 $mode2

        if [ $both = '0' ]; then
                clearMonitor $name1
        else
                setMonitor $name1 $rate1 $mode1 'one'
                xrandr --output $name2 --primary --output $name1 --left-of $name2
                bspc wm --reorder-monitors $name2 $name1
        fi
else
        setMonitor $name1 $rate1 $mode1
        clearMonitor $name2
fi

# Execute a binary executable, restart it if it is running
function cleverStart() {
    while pgrep $1 > /dev/null; do pkill $1; done
        nohup $1 $2 >> $HOME/.log/$1.log 2>&1 &
}
		'';

		settings = {
			border_width = 3;
			focused_border_color = "#3F73B6";
			presel_feedback_color = "#76628A";
			window_gap = 10;
			split_ratio = 0.52;
			borderless_monocle = true;
			gapless_monocle = true;
		};

		startupPrograms = [
			# "PATH=$HOME/.local/bin:$PATH sxhkd"
			"cleverStart clash"
			"cleverStart polybar_run"
			"cleverStart picom"
			"cleverStart fcitx5"
			"xset r rate 300 45"
			"xset dpms 0 0 0"
			"xset s on"
			"xset s 120 15"
		];
	};
}
