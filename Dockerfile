FROM debian:testing-slim

RUN apt-get update && apt-get install -y vlc

ARG VLC_UID="1000"
ARG VLC_GID="1000"

RUN groupadd -g "$VLC_GID" vlc && \
    useradd -m -d /data -s /bin/sh -u "$VLC_UID" -g "$VLC_GID" vlc && \

USER "vlc"

WORKDIR "/data"
VOLUME ["/data"]
