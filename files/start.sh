#!/bin/sh
if [ ! -f /conf/aria2.conf ]; then
	cp /conf-copy/aria2.conf /conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
	fi
fi
if [ ! -f /conf/on-complete.sh ]; then
	cp /conf-copy/on-complete.sh /conf/on-complete.sh
fi

if [ ! -f /data/completed ]; then
    mkdir -p /data/completed
fi

if [ ! -f /data/download ]; then
    mkdir -p /data/download
fi


chmod +x /conf/on-complete.sh
touch /conf/aria2.session

darkhttpd /aria2-webui --port 80 &
darkhttpd /data --port 8080 &
aria2c --conf-path=/conf/aria2.conf
