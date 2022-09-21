# syntax=docker/dockerfile:1

FROM golang:1.17-alpine3.13 AS golang
WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod download -x

COPY ./ ./

RUN go build main.go

EXPOSE 4444

CMD [ "./main" ]