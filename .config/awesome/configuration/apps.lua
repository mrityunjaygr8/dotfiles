return {
    default = {
        bluetooth_manager	=	"blueman-manager",
	power_manager		= 	"xfce4-power-manager",
    },
    run_on_start_up = {
	"picom --blur-method dual_kawase --blur-strength 9 --experimental-backends --config ~/.config/picom/picom.conf", 
	"clipmenud",
--	"xinput set-prop 12 292 1",
    }
}
