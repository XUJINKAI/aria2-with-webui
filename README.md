Aria2 with webui
---
1. downloading to /data/download. 
2. when download completed, move all downloaded files to /data/completed, include the directory structure. remove the *.aria2 control files, and empty directories.
3. add two parameters, PUID & PGID. if they are provided when start the container, the /data and /conf will be owned by PUID:PGID. if not provided, they will be owned by nobody:nogroup.

### Build:
```
git clone https://github.com/jackycxh/aria2-with-webui
cd aria2-with-webui
docker build -f Dockerfile -t jackycxh/aria2-with-webui .
```

### Run the container:

1. map volumes: /conf to your configuration directory, /data to your downloading directory.
2. provide PUID & PGID if you want.
3. map the network ports to the host. 6800/tcp for aria2 rpc, 80/tcp for WebUI, 8080/tcp for Web file browsing.
4. provide SECRET for security access of aria2 rpc.

example: 
```
    docker run -d \
        --name aria2-with-webui \
        -p 6800:6800 \
        -p 6880:80 \
        -p 6888:8080 \
        -v /DOWNLOAD_DIR:/data \    # replace /DOWNLOAD_DIR with your download directory in your host.
        -v /CONFIG_DIR:/conf \      # replace /CONFIG_DIR with your configure directory in your host.
        -e PUID=1000 \              # replace 1000 with the userid who will own all downloaded files and configuration files.
        -e PGID=1000 \              # replace 1000 with the groupid who will own all downloaded files and configuration files.
        -e SECRET=NOBODYKNOWSME \   # replace NOBODYKNOWSME with the secret for access Aria2 RPC services.
        jackycxh/aria2-with-webui
```

## Usage:
1. Open http://serverip:6880/ for aria2-webui, 
2. open http://serverip:6888/ to browse data folder. 
3. if you are access the RPC from other application, use http://serverip:6800/jsonrpc, and the secret you provided.

### Link:  
https://github.com/aria2/aria2  
https://github.com/ziahamza/webui-aria2  

