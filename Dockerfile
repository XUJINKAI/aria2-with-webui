FROM alpine:3.4

MAINTAINER xujinkai <jack777@xujinkai.net>

RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /conf && \
	mkdir -p /data && \
	apk add --no-cache --update aria2 && \
	apk add git && \
	git clone https://github.com/ziahamza/webui-aria2 /aria2-webui && \
	apk add --update darkhttpd && \
	apk add python py-pip && \
	pip install supervisor
	
ADD files/aria2.conf /conf/aria2.conf
ADD files/supervisord.conf /etc/supervisord.conf

WORKDIR /etc
VOLUME ["/data"]
EXPOSE 6800
EXPOSE 80

CMD ["supervisord"]
