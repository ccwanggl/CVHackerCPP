#!/usr/bin/env bash

xargs rm < out/build/install_manifest.txt

/bin/cat out/build/install_manifest.txt | xargs -L1 dirname | sudo xargs rmdir -p
