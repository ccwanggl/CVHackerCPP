# !/usr/bin/env bash

cmake -DCMAKE_INSTALL_PREFIX=$HOME/.local -DUSE_ARITHMETIC=ON  -S homework_1 -B out/build
