FROM golang:1.18 as builder
COPY ./output /go/output
COPY ./main.go /go/main.go
ENV CGO_ENABLED=0
RUN go build -o sugoi main.go

FROM scratch as prod
MAINTAINER Amane Katagiri
COPY --from=builder /go/sugoi /amanejp
ENTRYPOINT ["/amanejp"]
