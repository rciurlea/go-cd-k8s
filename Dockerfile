FROM golang:1.10.3 as builder
WORKDIR /go/src/app
ADD . .
RUN CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -o app .

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/app .
EXPOSE 8080
ENTRYPOINT ["/app"]
