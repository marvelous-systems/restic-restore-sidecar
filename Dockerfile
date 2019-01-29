FROM golang:latest as buildenv
WORKDIR /go/src/github.com/restic/
RUN git clone https://github.com/restic/restic
WORKDIR /go/src/github.com/restic/restic
RUN go version
RUN go run build.go --goos linux --goarch amd64

FROM alpine:latest as runtime
RUN apk --update add openssh
WORKDIR /restic
COPY --from=buildenv /go/src/github.com/restic/restic/restic /restic/restic
COPY scripts/ /restic/

ENTRYPOINT ["/restic/entrypoint.sh"]