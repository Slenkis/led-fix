#!/bin/sh

curl https://raw.githubusercontent.com/Slenkis/led-fix/master/ledfix.sh > /etc/init.d/ledfix
chmod +x /etc/init.d/ledfix
/etc/init.d/ledfix enable
