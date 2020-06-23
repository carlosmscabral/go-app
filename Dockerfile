FROM golang:1.14.0-alpine3.11 as builder
COPY main.go .
RUN go build -o /app main.go

FROM alpine:3.11
COPY --from=builder /app /
# ADD assets /assets
ADD templates /templates
CMD ["/app"]

