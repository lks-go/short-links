FROM golang:1.13

WORKDIR /go/src/shortlinks
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

EXPOSE 3000

CMD ["shortlinks"]
