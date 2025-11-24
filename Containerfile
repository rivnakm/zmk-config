FROM zmkfirmware/zmk-build-arm:stable

RUN apt update && apt install -y fish

RUN mkdir -p /workdir
WORKDIR /workdir

CMD ["fish", "/workdir/scripts/build.fish"]