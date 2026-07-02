FROM gozargah/marzban:latest
RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*
CMD bash -c 'alembic upgrade head && MARZBAN_ADMIN_PASSWORD="123456" marzban-cli admin delete -u admin -y 2>/dev/null; MARZBAN_ADMIN_PASSWORD="123456" marzban-cli admin create -u admin --sudo && python main.py & sleep 3 && socat TCP-LISTEN:8080,fork,reuseaddr TCP:127.0.0.1:8000'

