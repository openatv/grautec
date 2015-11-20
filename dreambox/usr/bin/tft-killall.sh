#! /bin/sh

#kill previous usbtftdisplay processes
kill -15 $(pidof -s usbtftdisplay) 1> /dev/null 2>&1
kill -15 $(pidof -s usbtftdisplay) 1> /dev/null 2>&1
if [ $(ps ax | grep "usbtftdisplay" -c) -ne 1 ]; then
		kill -9 $(pidof -s usbtftdisplay) 1> /dev/null 2>&1
fi

kill -15 $(pidof -s usbtftdisplay-bmp) 1> /dev/null 2>&1
kill -15 $(pidof -s usbtftdisplay-bmp) 1> /dev/null 2>&1
if [ $(ps ax | grep "usbtftdisplay-bmp" -c) -ne 1 ]; then
		kill -9 $(pidof -s usbtftdisplay-bmp) 1> /dev/null 2>&1
fi

kill -15 $(pidof -s usbtftdisplay-brightness) 1> /dev/null 2>&1
kill -15 $(pidof -s usbtftdisplay-brightness) 1> /dev/null 2>&1
if [ $(ps ax | grep "usbtftdisplay-brightness" -c) -ne 1 ]; then
		kill -9 $(pidof -s usbtftdisplay-brightness) 1> /dev/null 2>&1
fi

kill -15 $(pidof -s tft-fifoflush) 1> /dev/null 2>&1
kill -15 $(pidof -s tft-fifoflush) 1> /dev/null 2>&1
if [ $(ps ax | grep "tft-fifoflush" -c) -ne 1 ]; then
		kill -9 $(pidof -s tft-fifoflush) 1> /dev/null 2>&1
fi







