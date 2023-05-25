FROM alpine

WORKDIR /app

COPY ./serve /app/serve

# serve ファイルにポートバインディングを許可する
# https://jessicadeen.com/posts/2020/how-to-solve-the-listen-tcp-80-bind-permission-denied-error-in-docker/
RUN apk add libcap \
 && setcap 'cap_net_bind_service=+ep' /app/serve

# 非ルートユーザー appuser を追加する 
RUN adduser -u 1000 -D -H appuser \
 && chown appuser:appuser /app/serve

USER appuser

# 80 番ポートで実行するサーバープログラム
CMD ["/app/serve"]
