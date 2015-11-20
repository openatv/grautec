#! /bin/sh
filename_framecount=/etc/grautec/settings/framecount

rm -f /etc/grautec/settings/takeownership
sleep 1

rm -f $filename_framecount
echo 0 >> $filename_framecount
sleep 1

#kill previous usbtftdisplay processes
tft-killall.sh

sleep 1
/usr/bin/tft-fifoflush&
sleep 1
/usr/bin/usbtftdisplay&

