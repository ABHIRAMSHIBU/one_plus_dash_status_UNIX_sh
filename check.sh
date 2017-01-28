(( `id -u` == 0 )) || { echo "Must be root to run script"; exit 1; }
if [ $(whoami) != "root"]
then
	exit
fi
main_out="DASH status program, Abhiram Shibu"
command_starting="/sys/devices/soc/qpnp-smbcharger-17/power_supply/battery/fastchg_starting"
command_starting_message="Dash charging started :"
command_status="/sys/devices/soc/qpnp-smbcharger-17/power_supply/battery/fastchg_status"
command_status_message="Dash charging :"
command_current_limit="/sys/devices/soc/qpnp-smbcharger-17/power_supply/battery/input_current_limited"
command_current_limit_message="Current limited :"
command_current_max="/sys/devices/soc/qpnp-smbcharger-17/power_supply/battery/input_current_max"
command_current_max_message="Max current :"
command_current_now="/sys/devices/soc/qpnp-smbcharger-17/power_supply/battery/input_current_now"
command_current_now_message="Current :"
command_status="/sys/devices/soc/qpnp-smbcharger-17/power_supply/battery/status"
command_status_message="Battery status :"
while :
do
	if [ $(cat $command_starting) == "1" ]
	then
  		starting="Yup!"
	else
   		starting="NOP!"
	fi
	if [ $(cat $command_status) == "1" ]
	then
		status="Yup!"
	else
		status="NOP!"
	fi
	if [ $(cat $command_current_limit) == "1" ]
	then
		limit="Yes"
	else
		limit="Nop"
	fi
	clear
	echo $main_out
	echo $command_starting_message$starting
	echo $command_status_message$status
	echo $command_current_limit_message$limit
	echo $command_current_max_message$(cat $command_current_max)
	echo $command_current_now_message$(cat $command_current_now)
	echo $command_status_message$(cat $command_status)
	sleep 0.1
done
