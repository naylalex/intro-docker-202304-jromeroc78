FROM golang:latest AS build
WORKDIR /app
COPY . .
RUN go build dispatcher.go
FROM golang AS build2
WORKDIR /app
COPY --from=build /app/dispatcher ./
COPY --from=build /app/static ./static
RUN chmod -R 777 static