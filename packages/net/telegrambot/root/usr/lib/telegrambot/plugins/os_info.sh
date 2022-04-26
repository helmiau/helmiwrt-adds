#!/bin/sh
#--------------------------------------------------------
#   If you use some codes frome here, please give credit to www.helmiau.com
#--------------------------------------------------------
echo "===============================" > /tmp/osinfo.txt
echo "     OpenWrt OS Information" >> /tmp/osinfo.txt
echo "===============================" > /tmp/osinfo.txt
echo -e "OS: $(grep DISTRIB_ID /etc/openwrt_release | cut -d \' -f2) - $(grep DISTRIB_RELEASE /etc/openwrt_release | cut -d \' -f2)" >> /tmp/osinfo.txt
if [ -e /bin/is_immortalwrt_based ]; then
	echo -e "Build Date: $(grep DISTRIB_RELEASE /etc/openwrt_release | cut -d \' -f2 | cut -d \- -f1) | $(grep DISTRIB_DESCRIPTION /etc/openwrt_release | cut -d \( -f2 | cut -d \) -f1)"  >> /tmp/osinfo.txt
else
	echo -e "Build Date: $(grep DISTRIB_REVISION /etc/openwrt_release | cut -d \' -f2)"  >> /tmp/osinfo.txt
fi
echo -e "Architecture: $(grep DISTRIB_ARCH /etc/openwrt_release | cut -d \' -f2)" >> /tmp/osinfo.txt
echo -e "LuCI IP: $(uci show network | grep network.lan.ipaddr | cut -d \' -f2)" >> /tmp/osinfo.txt
echo "===============================" >> /tmp/osinfo.txt
echo "      Created by helmiau" >> /tmp/osinfo.txt
echo "===============================" >> /tmp/osinfo.txt
cat /tmp/osinfo.txt
rm /tmp/osinfo.txt

