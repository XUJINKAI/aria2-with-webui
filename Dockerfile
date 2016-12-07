FROM alpine:3.4

MAINTAINER xujinkai <jack777@xujinkai.net>

RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /conf && \
	mkdir -p /conf-copy && \
	mkdir -p /data && \
	apk add --no-cache --update aria2 && \
	apk add git && \
	git clone https://github.com/ziahamza/webui-aria2 /aria2-webui && \
	apk add --update darkhttpd
	
ADD files/start.sh /conf-copy/start.sh
ADD files/aria2.conf /conf-copy/aria2.conf
ADD files/on-complete.sh /conf-copy/on-complete.sh

WORKDIR /
VOLUME ["/data"]
VOLUME ["/conf"]
EXPOSE 6800
EXPOSE 80

CMD ["/conf-copy/start.sh"]
