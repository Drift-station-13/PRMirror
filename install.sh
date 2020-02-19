#!/bin/bash

pr_path = $PWD

echo GitHubToken?
read git_hub_token

sed 's/thegittoken/${git_hub_token}/g' config.json > configed.json
sed -i 's/theprpath/${pr_path}/g' configed.json

# build
export GOPATH="$PWD/go_path"
cd "$GOPATH/src/PRMirror"
go get
go build

cd $pr_path
cp configed.json $GOPATH/bin/config.json

git clone https://github.com/Drift-station-13/Drift_station_13.git
cd Drift_station_13
git config credential.helper store
git push