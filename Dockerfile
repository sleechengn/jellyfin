FROM linuxserver/jellyfin:latest
RUN apt update
RUN apt install -y fonts-noto-cjk-extra jellyfin-ffmpeg7
ENV PUID=0
ENV PGID=0
COPY ./fonts /config/fonts
