FROM ubuntu:latest

WORKDIR /app

RUN apt update \
    && apt install -yq sudo \
        software-properties-common

RUN add-apt-repository ppa:haxe/releases -y

RUN apt install -yq haxe

RUN mkdir haxelib \
    && haxelib setup /app/haxelib

WORKDIR /workspace

COPY bin .

CMD ["haxe", "--run", "Main.hx"]