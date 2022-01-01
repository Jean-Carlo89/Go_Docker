FROM golang:alpine as builder

WORKDIR /go/src/app
COPY . .
# RUN go mod init
# RUN go get -d -v ./...
# RUN go install -v ./...
RUN CGO_ENABLED=0 go build -o /app main.go
# RUN go mod init &&\
#  go build -o 
FROM scratch

COPY --from=builder /app /app

CMD ["/app"]
