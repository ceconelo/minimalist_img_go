FROM golang:1.20-alpine3.17 as build

WORKDIR /app

COPY main.go .

RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o app main.go


FROM scratch

COPY --from=build /app/app /

CMD ["/app"]