# compile the project
FROM golang:1.23.5-alpine3.21 AS builder

WORKDIR /app
COPY . .
RUN go build -o test_gin test_gin.go

# build the docker image using compiled file
FROM alpine:3.21

COPY --from=builder /app/test_gin .
RUN chmod +x test_gin

ENTRYPOINT [ "./test_gin" ]