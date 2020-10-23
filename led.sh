#!/bin/sh

if [[ $1 == "on" ]]; then

uci set system.led_wan_amber.trigger='switch0'
uci set system.led_lan1_amber.trigger='switch0'
uci set system.led_lan2_amber.trigger='switch0'
uci set system.@led[3].trigger='default-on'

elif [[ $1 == "off" ]]; then

uci set system.led_wan_amber.trigger='none'
uci set system.led_lan1_amber.trigger='none'
uci set system.led_lan2_amber.trigger='none'
uci set system.@led[3].trigger='none'

fi

/etc/init.d/led restart
