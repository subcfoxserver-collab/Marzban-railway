FROM gozargah/marzban:latest

RUN apt-get update && apt-get install -y socat

CMD bash -c 'alembic upgrade head && python main.py & sleep 2 && socat TCP-LISTEN:${PORT:-8000},fork,reuseaddr TCP:127.0.0.1:8000'

