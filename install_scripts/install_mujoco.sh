#!/bin/bash

set -e 
INSTALLDIR=$HOME/.mujoco
FILE=$INSTALLDIR/mujoco210
if [[ -d "$FILE" ]]; then
    echo "$FILE already exists"
else
    wget -c -O /tmp/mujoco210.tar.gz https://github.com/deepmind/mujoco/releases/download/2.1.0/mujoco210-linux-x86_64.tar.gz
    mkdir -p $HOME/.mujoco
    tar -xf /tmp/mujoco210.tar.gz -C $INSTALLDIR
fi
echo -e "(NOTE) Add following to bashrc to use mujoco-py \nexport LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:\$HOME/.mujoco/mujoco210/bin"
