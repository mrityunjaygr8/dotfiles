return {
    default = {
        bluetooth_manager	=	"blueman-manager",
	power_manager		= 	"xfce4-power-manager",
    },
    run_on_start_up = {
	"picom --blur-method dual_kawase --blur-strength 9 --experimental-backends --config ~/.config/picom/picom.conf", 
	"clipmenud",
	"xautolock -detectsleep -time 5 -locker ~/.config/general/lock.sh -notify 10 -notifier \"notify-send -t 10000 -- 'LOCKING screen in 10 seconds'\"",
--	"xinput set-prop 12 292 1",
    }
}
