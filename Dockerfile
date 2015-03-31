FROM gliderlabs/alpine:3.1
RUN apk --update add bash
ADD start-config /
ENTRYPOINT ["/start-config"]
