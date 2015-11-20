#! /bin/sh
# Zeigt das Fernsehbild auf dem TFT-Display an (langsam)
# Insgesamt 1000 Frames

tft-bmp-mode.sh
sleep 1

for i in $(seq 1 1 1000)  
do
  grab  -n -r 400x240 -v >> /dev/null
  cat /tmp/screenshot.bmp  >  /tmp/usbtft-bmp
done
echo 'Done.'



