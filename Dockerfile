FROM gozargah/marzban:latest
RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*
ENV SUDO_PASSWORD=123456
CMD bash -c 'rm -f /var/lib/marzban/db.sqlite3 && alembic upgrade head && python main.py & sleep 3 && socat TCP-LISTEN:8080,fork,reuseaddr TCP:127.0.0.1:8000'
