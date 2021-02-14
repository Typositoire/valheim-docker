# Valheim Docker

This image uses `steamcmd/steamcmd:ubuntu-18` as a base.

## ASSUMPTIONS

Version is unknown until used?!

## Systemd Unit Example

`/etc/systemd/system/valheim-server.service`

```
[Unit]
Description=Valheim Server
After=docker.service
Requires=docker.service

[Service]
Restart=always
RestartSec=60
StartLimitInterval=600
StartLimitBurst=10
ExecStart=/usr/bin/docker run \
        --init \
        --rm \
        --name valheim-server \
        -v valheim-worlds:/root/.config/unity3d/IronGate/Valheim/ \
        -e VH_SERVER_NAME="SERVERNAME" \
        -e VH_SERVER_PASSWORD="CHANGEME" \
        -p 2456:2456 \
        -p 2456:2456/udp \
        -p 2457:2457 \
        -p 2457:2457/udp \
        -p 2458:2458 \
        -p 2458:2458/udp \
        typositoire/valheim-server

ExecStop=/usr/bin/docker kill valheim-server

[Install]
WantedBy=multi-user.target
```

## Instructions

1- Start the container

2- Expose ports 2456-2458
   Only UDP should be required but I'll let you figure it out.

3- Make sure you bind a volume on `/root/.config/unity3d/IronGate/Valheim/` to avoid losing your world on container restart.