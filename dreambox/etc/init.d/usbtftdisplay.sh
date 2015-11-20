#! /bin/sh
filename=/proc/stb/info/model
filename_xres=/proc/stb/lcd/xres
filename_framecount=/etc/grautec/settings/framecount
#filename_ownership=/etc/grautec/settings/takeownership
#filename_noskin=/etc/grautec/settings/noskin
FRAMECOUNT=0
BOXNAME=$(cat $filename)
OLEDINT=/dev/dbox/oledint
#libusbscript=/etc/grautec/$BOXNAME/libs/install_libs.sh
#updatescript=/etc/grautec/firmware/fupdate
DEVICEAVAILABLE=$(lsusb | grep "16d0:054d" -c)
#GETVERSION=$(lsusb -d 16d0:054d -v | grep iSerial | cut -c29-34)

#if usbtftdisplay available
if [ $DEVICEAVAILABLE -eq 1 ]; then
	tft-killall.sh

	rm -f /tmp/usbtft
	rm -f /tmp/usbtft-bmp
	rm -f /tmp/usbtft-brightness

	mkdir -p /dev/dbox
	mkfifo /tmp/usbtft


	#rm -f /dev/dbox/lcd0 

	if [ -e $OLEDINT ];
	then
		rm -f /dev/dbox/oled0 
	else
		mv /dev/dbox/oled0 /dev/dbox/oledint
		rm -f /dev/dbox/oled0
		#sleep 1
	fi

	#set high resolution
	if [ -e $filename_xres ];
	then
		if [ "$(cat $filename_xres)" = "00000060" ];
		then 
			insmod /etc/grautec/$BOXNAME/tft_$BOXNAME.ko
		fi
		#sleep 1
	else
		#sleep 1
		insmod /etc/grautec/$BOXNAME/tft_$BOXNAME.ko
	fi

	#start delay in frames
	if [ -e $filename_framecount ];
	then
		rm -f $filename_framecount 
		echo $FRAMECOUNT >> $filename_framecount
	fi

	#start display 
	/usr/bin/usbtftdisplay&
	#/usr/bin/tft-fifoflush&
	ln -s /tmp/usbtft /dev/dbox/oled0
fi


