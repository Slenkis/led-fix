#!/bin/bash

crontask="\
30 08 * * * /usr/bin/led on
00 22 * * * /usr/bin/led off"

# WAN
uci set system.led_wan_amber.trigger='switch0'
uci set system.led_wan_amber.port_mask='0x2'
uci set system.led_wan_amber.speed_mask='0xf'
uci set system.led_wan_amber.mode='link'

# LAN 1
uci set system.led_lan1_amber.trigger='switch0'
uci set system.led_lan1_amber.port_mask='0x8'
uci set system.led_lan1_amber.speed_mask='0xf'
uci set system.led_lan1_amber.mode='link'

# LAN 2
uci set system.led_lan2_amber.trigger='switch0'
uci set system.led_lan2_amber.port_mask='0x4'
uci set system.led_lan2_amber.speed_mask='0xf'
uci set system.led_lan2_amber.mode='link'

# FRONT
uci set system.@led[3].trigger='default-on'

# SAVE
uci commit

# RELOAD
/etc/init.d/led restart > /dev/null
echo "Done! LEDs are configured."

echo
echo -n "Would you like to install a script for on/off LEDs? (Y/n): "
read answer1

if [[ $answer1 == "y" || $answer1 == "Y" ]]; then
    if [[ -z $(command -v curl) ]]; then
        echo
        echo "Error! Please, install curl and try again."
        echo "opkg install curl"
        exit
    fi

    # Installing on/off script #
    /usr/bin/curl -s https://raw.githubusercontent.com/Slenkis/led-fix/master/led.sh > /usr/bin/led
    chmod +x /usr/bin/led
    echo
    echo "Installation completed!"

    echo
    echo -n "Do you want to turn off the LEDs at night and turn on during the day? (Y/n): "
    read answer2

    if [[ $answer2 == "y" || $answer2 == "Y" ]]; then
        echo
        echo "$crontask" >> /etc/crontabs/$USER
        /etc/init.d/cron restart
        echo "Done!"
    fi
fi
