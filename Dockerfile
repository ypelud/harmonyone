FROM alpine:3.8
MAINTAINER ypelud@gmail.com

RUN apk update && \
  apk add curl && \
  rm -r /var/cache/

RUN adduser -D hmy
USER hmy

WORKDIR /app

RUN curl -LO https://harmony.one/hmycli && mv hmycli hmy && chmod +x hmy

CMD ["/app/hmy", "--node='https://api.s0.t.hmny.io'", "cookbook"]