repo=tttlkkkl/http-echo
tag?=latest
compile:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o app -work $(shell pwd)/cmd/echo-server
build:
	docker build -t $(repo):$(tag) $(shell pwd)
run:
	LOG_HTTP_HEADERS=1 LOG_HTTP_BODY=1 ./app
push:
	docker push $(repo):$(tag)