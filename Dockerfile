FROM golang:1.10.4 AS build
WORKDIR /go/src/github.com/scriptonist/demo

RUN go get github.com/golang/dep/cmd/dep
COPY Gopkg.toml Gopkg.lock ./
RUN dep ensure -v -vendor-only

COPY main.go main.go
RUN CGO_ENABLED=0 GOOS=linux go build -o /go/bin/demo -ldflags="-w -s" -v github.com/scriptonist/demo

FROM alpine:3.8 AS final
RUN apk --no-cache add ca-certificates
COPY --from=build /go/bin/demo /bin/demo