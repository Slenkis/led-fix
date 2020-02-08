#!/bin/sh /etc/rc.common

START=97

start() {

## WAN
echo 0x2 > /sys/class/leds/mir3g:amber:wan/port_mask
echo 0xf > /sys/class/leds/mir3g:amber:wan/speed_mask
echo link > /sys/class/leds/mir3g:amber:wan/mode

## LAN 1
echo 0x8 > /sys/class/leds/mir3g:amber:lan1/port_mask
echo 0xf > /sys/class/leds/mir3g:amber:lan1/speed_mask
echo link > /sys/class/leds/mir3g:amber:lan1/mode

## LAN 2
echo 0x4 > /sys/class/leds/mir3g:amber:lan2/port_mask
echo 0xf > /sys/class/leds/mir3g:amber:lan2/speed_mask
echo link > /sys/class/leds/mir3g:amber:lan2/mode

}
