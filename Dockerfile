FROM golang:1.17-alpine AS builder
WORKDIR /go/src/app
COPY . .
RUN go mod init
RUN go build -o /app

FROM scratch
COPY --from=builder /app /app

ENTRYPOINT [ "/app" ]