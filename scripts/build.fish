#!/usr/bin/env fish

set -l CONFIG_DIR /workdir/config
test -f .west/config || west init -l $CONFIG_DIR
west update --fetch-opt=--filter=tree:0
west zephyr-export

set -l EXTRA_CMAKE_ARGS "-DZMK_CONFIG=$CONFIG_DIR"

west build -s zmk/app \
    -d build/left -b "nice_nano_v2" -- -DSHIELD="cradio_left" $EXTRA_CMAKE_ARGS || return;
cp -v build/left/zephyr/zmk.uf2 sweep_left.uf2
    
west build -s zmk/app \
    -d build/right -b "nice_nano_v2" -- -DSHIELD="cradio_right" $EXTRA_CMAKE_ARGS || return;
cp -v build/right/zephyr/zmk.uf2 sweep_right.uf2

west build -s zmk/app \
    -d build/settings_reset -b "nice_nano_v2" -- -DSHIELD="settings_reset" $EXTRA_CMAKE_ARGS || return;
cp -v build/settings_reset/zephyr/zmk.uf2 settings_reset.uf2
