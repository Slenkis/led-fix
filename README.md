# LEDs configuration on Xiaomi Router 3G v1 (mir3g)
## 1. Set triggers in /etc/config/system
```
config led
        option name 'wan'
        option sysfs 'amber:wan'
        option trigger 'netdev'
        option dev 'wan'
        list mode 'link'

config led
        option name 'lan1'
        option sysfs 'amber:lan1'
        option trigger 'netdev'
        option dev 'lan1'
        list mode 'link'

config led
        option name 'lan2'
        option sysfs 'amber:lan2'
        option trigger 'netdev'
        option dev 'lan2'
        list mode 'link'

config led
        option name 'front'
        option sysfs 'blue:status'
        option trigger 'default-on'
```
## 2. Run script for on/off leds
`./leds off` - Disable wan, lan1, lan2 amber leds and disable front blue led  
`./leds on` - Enable wan, lan1, lan2 amber leds and enable front blue led
