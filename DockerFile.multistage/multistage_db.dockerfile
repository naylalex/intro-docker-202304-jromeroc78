FROM alpine:latest

RUN apk add --no-cache postgresql-client

COPY words.sql /docker-entrypoint-initdb.d/