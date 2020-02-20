#!/bin/bash

pr_path=$PWD

echo GitHubToken?
read git_hub_token

sed "s@thegittoken@$git_hub_token@" config.json > config_0.json
sed "s@theprpath@$pr_path@" config_0.json > configed.json
rm config_0.json

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

chmod u+x $pr_path/Drift_station_13/merge-upstream-pull-request.sh $GOPATH/bin/PRMirror $pr_path/start.sh
