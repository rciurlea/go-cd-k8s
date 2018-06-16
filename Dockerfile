FROM golang:1.10.3 as builder
WORKDIR /
WORKDIR /go/src/github.com/rciurlea/mds-go-cd-k8s
ADD . .
RUN go build -o app
RUN ls -la

FROM alpine
COPY --from=builder /go/src/github.com/rciurlea/mds-go-cd-k8s/app /app
RUN ls -la /app
EXPOSE 8080
CMD ["/app"]
