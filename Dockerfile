FROM gozargah/marzban:latest

RUN apt-get update && apt-get install -y openssl && \
    mkdir -p /etc/marzban/ssl && \
    openssl req -x509 -nodes -days 3650 \
    -newkey rsa:2048 \
    -keyout /etc/marzban/ssl/key.pem \
    -out /etc/marzban/ssl/cert.pem \
    -subj "/C=US/ST=Test/L=Test/O=Test/CN=localhost"

ENV UVICORN_HOST=0.0.0.0
ENV UVICORN_PORT=8000
ENV UVICORN_SSL_CERTFILE=/etc/marzban/ssl/cert.pem
ENV UVICORN_SSL_KEYFILE=/etc/marzban/ssl/key.pem

