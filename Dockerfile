# https://github.com/docker-library/golang
FROM golang:1.19 as build-env

WORKDIR /go/src/app

ADD . ./

RUN go build -ldflags="-s -w" -o /go/bin/famed-backend

# https://github.com/GoogleContainerTools/distroless
FROM docker:dind

COPY --from=build-env /go/bin/famed-backend /

CMD ["/famed-backend"]
