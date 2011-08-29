#!/sbin/sh

/system/bin/tiap_loader -i /system/etc/wifi/softap/tiwlan_ap.ini -f /system/etc/wifi/softap/tiwlan_firmware_ap.bin -e /data/etc/wifi/fw
/system/bin/ifconfig tiap0 up