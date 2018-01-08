Aria2 with webui
---
Only 29Mb.  
Edit config file out of the image.  
while the download completed,
1. Move file(s) completed to /data/completed include the directory structure.
2. remove the *.aria2 control files.
3. remove the empty directory in.

### Install
I. replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** for save data, and **YOUR_SECRET_CODE** for security. Run command below  
```
sudo docker run -d \
--name aria2-with-webui \
-p 6800:6800 \
-p 6880:80 \
-p 6888:8080 \
-v /DOWNLOAD_DIR:/data \
-v /CONFIG_DIR:/conf \
-e SECRET=YOUR_SECRET_CODE \
xujinkai/aria2-with-webui
```
  
II. Open `http://serverip:6880/` for aria2-webui, open `http://serverip:6888/` to browse data folder.  

### Build:  
`sudo docker build -f Dockerfile -t xujinkai/aria2-with-webui .`  

### Link:  
https://github.com/aria2/aria2  
https://github.com/ziahamza/webui-aria2  

https://github.com/acgotaku/BaiduExporter  
