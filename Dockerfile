# Basis: Leichtgewichtiger Python-Container
FROM python:3.10-slim

# Systemabhängigkeiten + Node.js + n8n
RUN apt update && apt install -y git curl ffmpeg bash build-essential && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt install -y nodejs && \
    npm install -g n8n && \
    rm -rf /var/lib/apt/lists/*

# Arbeitsverzeichnis setzen
WORKDIR /workspace

# requirements.txt kopieren und installieren (falls vorhanden)
COPY requirements.txt . 
RUN pip install --no-cache-dir -r requirements.txt || true

# Alle Projektdateien kopieren
COPY . /workspace

# Startscript ausführbar machen
RUN chmod +x start.sh

# Standardkommando: Startscript
CMD ["/workspace/start.sh"]





