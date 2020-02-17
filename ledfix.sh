#!/bin/sh /etc/rc.common

START=97

start() {

sys="/sys/class/leds/mir3g:amber"

## WAN
echo 0x2 > $sys:wan/port_mask
echo 0xf > $sys:wan/speed_mask
echo link > $sys:wan/mode

## LAN 1
echo 0x8 > $sys:lan1/port_mask
echo 0xf > $sys:lan1/speed_mask
echo link > $sys:lan1/mode

## LAN 2
echo 0x4 > $sys:lan2/port_mask
echo 0xf > $sys:lan2/speed_mask
echo link > $sys:lan2/mode

}
