#!/usr/bin/env bash

. /etc/profile

WORKDIR="/work"
mkdir -p $WORKDIR
pushd $WORKDIR
jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token=''
