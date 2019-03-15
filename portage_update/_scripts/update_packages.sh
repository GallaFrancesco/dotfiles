#!/bin/bash

echo "==== Launching system update ===="
export EMERGE_DEFAULT_OPTS="--quiet"
emerge --sync
layman -s dlang
emerge --update --newuse --with-bdeps=y --deep --keep-going @world
emerge --depclean
emerge --unmerge at-spi2-core at-spi2-atk dbus cups cups-filters
eclean --deep packages
eclean --deep distfiles
echo "==== Finished system update ===="
