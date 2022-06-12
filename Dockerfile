FROM golang:1.18 as builder
COPY ./output /go/output
COPY ./sugoi.go /go/sugoi.go
ENV CGO_ENABLED=0
RUN go build -o sugoi sugoi.go

FROM scratch as prod
MAINTAINER Amane Katagiri
COPY --from=builder /go/sugoi /amanejp
ENTRYPOINT ["/amanejp"]
