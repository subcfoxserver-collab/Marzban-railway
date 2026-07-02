FROM gozargah/marzban:latest
RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*
ENV SUDO_USERNAME=MAD1
ENV SUDO_PASSWORD=MAD1
CMD bash -c 'rm -rf /var/lib/marzban/*.sqlite3 2>/dev/null; alembic upgrade head; python main.py & sleep 3; socat TCP-LISTEN:8080,fork,reuseaddr TCP:127.0.0.1:8000'

