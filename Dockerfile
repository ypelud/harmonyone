FROM alpine:3.8
LABEL maintainer="ypelud@gmail.com"

RUN apk update && \
  apk add curl && \
  rm -r /var/cache/

RUN adduser -D hmy

RUN mkdir -p /app/.hmy/blskeys
RUN chown -R hmy:hmy /app

WORKDIR /app

USER hmy

VOLUME /app/.hmy
RUN whoami

RUN curl -LO https://harmony.one/hmycli && mv hmycli hmy && chmod +x hmy

EXPOSE 6500/tcp
EXPOSE 9000/tcp

CMD ["/app/hmy", "--node='https://api.s0.t.hmny.io'", "cookbook"]