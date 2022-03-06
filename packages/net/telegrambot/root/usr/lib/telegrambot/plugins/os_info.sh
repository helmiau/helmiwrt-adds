#!/bin/sh
#--------------------------------------------------------
#   If you use some codes frome here, please give credit to www.helmiau.com
#--------------------------------------------------------
echo "==== OpenWrt OS Information ====" > /tmp/osinfo.txt
echo -e "OS: $(grep DISTRIB_ID /etc/openwrt_release | cut -d \' -f2) - $(grep DISTRIB_RELEASE /etc/openwrt_release | cut -d \' -f2)" >> /tmp/osinfo.txt
echo -e "Build Date: $(grep DISTRIB_REVISION /etc/openwrt_release | cut -d \' -f2)" >> /tmp/osinfo.txt
echo -e "Architecture: $(grep DISTRIB_ARCH /etc/openwrt_release | cut -d \' -f2)" >> /tmp/osinfo.txt
echo -e "LuCI IP: $(uci show network | grep network.lan.ipaddr | cut -d \' -f2)" >> /tmp/osinfo.txt
if curl -s --max-time 5 --connect-timeout 5 ip-api.com/line\?fields=query,isp -v 2>&1 | grep -q 'HTTP/1.1 200 OK'; then
	echo -e "Public IP: $(curl -s --max-time 3 --connect-timeout 3 ip-api.com/line/\?fields=query)" >> /tmp/osinfo.txt
	echo -e "ISP: $(curl -s --max-time 3 --connect-timeout 3 ip-api.com/line/\?fields=isp)" >> /tmp/osinfo.txt
else
	echo -e "Public IP: Not Available - No Connection" >> /tmp/osinfo.txt
	echo -e "ISP: Not Available - No Connection" >> /tmp/osinfo.txt
fi
echo "===============================" >> /tmp/osinfo.txt
echo "==    Created by helmiau     ==" >> /tmp/osinfo.txt
echo "===============================" >> /tmp/osinfo.txt
cat /tmp/osinfo.txt
rm /tmp/osinfo.txt

