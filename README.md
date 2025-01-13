Jellyfin

```
networks:
  lan13:
    name: lan13
    driver: macvlan
    driver_opts:
      parent: eth1
    ipam:
      config:
        - subnet: "192.168.13.0/24"
          gateway: "192.168.13.1"
services:
  jellyfin:
    container_name: "jellyfin"
    hostname: "jellyfin"
    image: "sleechengn/jellyfin:latest"
    restart: always
    environment:
      PUID: 0
      PGID: 0
    volumes:
      - "/opt/apps/jellyfin/config:/config"
      - "/opt/apps/jellyfin/cache:/cache"
      - "/opt/apps/jellyfin/media:/media"
    devices:
      - "/dev/dri"
    networks:
      lan13:
        ipv4_address: 192.168.13.54
  metatube-server:
    container_name: "metatube-server"
    hostname: "metatube-server"
    image: "metatube/metatube-server:latest"
    restart: always
    networks:
      lan13:
        ipv4_address: 192.168.13.55
  metatube-plugin:
    container_name: "metatube-plugin"
    hostname: "metatube-plugin"
    restart: always
    image: "sleechengn/metatube-plugin:latest"
    networks:
      lan13:
        ipv4_address: 192.168.13.56
```
