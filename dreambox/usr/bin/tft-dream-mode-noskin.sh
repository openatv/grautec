#! /bin/sh
filename_xres=/proc/stb/lcd/xres
filename_noskin=/etc/grautec/settings/noskin
filename_ownership=/etc/grautec/settings/takeownership
XRES=$(cat $filename_xres)

tft-killall.sh

echo 0 >> $filename_noskin
echo 0 >> $filename_takeownership


#set high resolution
if [ -e $filename_xres ];
then
	if [ "$XRES" = "00000060" ];
	then 
		echo "Run init 4 and init 3."
	fi
else
	echo "Needs reboot."
fi
