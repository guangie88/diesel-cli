FROM alpine:3.7 as provider
COPY ./bin/diesel /usr/local/bin/
