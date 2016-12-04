Aria2 with webui
---

run image  
`sudo docker run --name aria2-with-webui -d -p 6800:6800 -p 6880:80 -v /volume1/temp/aria2:/data xujinkai/aria2-with-webui`

Open `http://localhost:6880/` in Browser

### Build:  
`sudo docker build -f Dockerfile -t xujinkai/aria2-with-webui .`  

### Link:  
https://github.com/aria2/aria2  
https://github.com/ziahamza/webui-aria2  

https://github.com/acgotaku/BaiduExporter  