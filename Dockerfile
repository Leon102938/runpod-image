# Dockerfile
FROM python:3.10-slim

# Systemabhängigkeiten + Node.js + n8n
RUN apt update && apt install -y git curl ffmpeg && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt install -y nodejs && \
    npm install -g n8n && \
    rm -rf /var/lib/apt/lists/*

# Arbeitsverzeichnis setzen
WORKDIR /workspace

# Python-Abhängigkeiten installieren
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Projektdateien kopieren
COPY . /workspace

# start.sh ausführbar machen
RUN chmod +x start.sh

# Start-Skript aufrufen
CMD ["bash", "start.sh"]


