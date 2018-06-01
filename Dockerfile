FROM guangie88/muslrust-extra:stable as builder
RUN cargo install diesel_cli --no-default-features \
    --features "postgres mysql sqlite"

FROM alpine:3.7 as provider
COPY --from=builder /root/.cargo/bin/diesel /usr/local/bin/
