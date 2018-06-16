FROM golang:1.10.3
WORKDIR /
WORKDIR /go/src/github.com/rciurlea/mds-go-cd-k8s
ADD . .
RUN CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -o app .

FROM alpine
RUN apk --no-cache add ca-certificates
WORKDIR /root
RUN ls -la
COPY --from=0 /go/src/github.com/rciurlea/mds-go-cd-k8s/app .
RUN ls -la
EXPOSE 8080
ENTRYPOINT ["/root/app"]
