FROM guangie88/muslrust-extra:stable as builder

ARG DIESEL_VER=
ENV DIESEL_VER=$DIESEL_VER

RUN cargo install diesel_cli --vers "=$DIESEL_VER" --no-default-features \
    --features "postgres mysql sqlite"

FROM alpine:3.7 as provider

RUN apk add --no-cache ca-certificates
COPY --from=builder /root/.cargo/bin/diesel /usr/local/bin/
