Aria2 with webui
---
Only 58Mb.  
Edit config file out of the image.  
Move complete file to another folder.  

### Install
1. replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** for save data, and **YOUR_SECRET_CODE** for security. Run command below  
```
sudo docker run -d \
--name aria2-with-webui \
-p 6800:6800 -p 6880:80 \
-v /DOWNLOAD_DIR:/data \
-v /CONFIG_DIR:/conf \
-e SECRET=YOUR_SECRET_CODE \
xujinkai/aria2-with-webui
```

2. Open `http://127.0.0.1:6880/` in Browser, input host, port and your secret code.  

### Build:  
`sudo docker build -f Dockerfile -t xujinkai/aria2-with-webui .`  

### Link:  
https://github.com/aria2/aria2  
https://github.com/ziahamza/webui-aria2  

https://github.com/acgotaku/BaiduExporter  