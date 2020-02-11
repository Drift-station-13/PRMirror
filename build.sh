export GOPATH="$PWD/go_path"
cd "$GOPATH/src/PRMirror"
go get
go build
cd "$GOPATH/bin"
bash