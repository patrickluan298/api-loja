FROM golang:1.18-alpine as build

ENV GOOS=linux
ENV GOARCH=amd64
ENV CGO_ENABLED=0
ENV GO111MODULE=on
ENV WORKSPACE=${GOPATH}/src/app

RUN apk add --no-cache --virtual .build-deps build-base

WORKDIR ${WORKSPACE}

COPY . .

RUN go build -ldflags '-extldflags "-static"' -o bin/app main.go

CMD ["./bin/app"]