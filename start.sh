#!/bin/bash

cd Drift_station_13
git config credential.helper store
git push

cd ..
export GOPATH="$PWD/go_path"
cd $GOPATH/bin
./PRMirror