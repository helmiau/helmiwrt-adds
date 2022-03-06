#!/bin/sh
#--------------------------------------------------------
#   If you use some codes frome here, please give credit to www.helmiau.com
#--------------------------------------------------------
echo "==== IP Detail Information ====" > ipinfo.txt
curl -s http://ip-api.com/json/\?fields=country,countryCode,region,regionName,city,timezone,isp,org,as,asname,query >> ipinfo.txt
sed -i 's/{"//g' ipinfo.txt
sed -i 's/","/\n/g' ipinfo.txt
sed -i 's/":"/ : /g' ipinfo.txt
sed -i 's/"}//g' ipinfo.txt
sed -i 's/":/ : /g' ipinfo.txt
sed -i 's/,"/\n/g' ipinfo.txt
sed -i 's/status :/Status		:/g' ipinfo.txt
sed -i 's/continent :/Continent	:/g' ipinfo.txt
sed -i 's/continentCode :/Continent Code	:/g' ipinfo.txt
sed -i 's/country :/Country Name	:/g' ipinfo.txt
sed -i 's/countryCode :/Country Code	:/g' ipinfo.txt
sed -i 's/region :/Region		:/g' ipinfo.txt
sed -i 's/regionName :/Region Name	:/g' ipinfo.txt
sed -i 's/city :/City		:/g' ipinfo.txt
sed -i 's/zip :/ZIP Code	:/g' ipinfo.txt
sed -i 's/lat :/Latitude	:/g' ipinfo.txt
sed -i 's/lon :/Longitude	:/g' ipinfo.txt
sed -i 's/timezone :/Timezone	:/g' ipinfo.txt
sed -i 's/isp :/ISP		:/g' ipinfo.txt
sed -i 's/org :/Organization	:/g' ipinfo.txt
sed -i 's/as :/AS		:/g' ipinfo.txt
sed -i 's/asname :/AS Name		:/g' ipinfo.txt
sed -i 's/query :/IP Address	:/g' ipinfo.txt
echo " " >> ipinfo.txt
echo "===============================" >> ipinfo.txt
echo "==    Created by helmiau     ==" >> ipinfo.txt
echo "===============================" >> ipinfo.txt
cat ipinfo.txt
rm ipinfo.txt
