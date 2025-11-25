FROM zmkfirmware/zmk-build-arm:stable

RUN apt update && apt install -y fish imagemagick inkscape pipx

RUN mkdir -p /workdir
WORKDIR /workdir

CMD ["fish", "/workdir/scripts/build.fish"]