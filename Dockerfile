# Basis: Python + Debian slim
FROM python:3.10-slim

# System-Tools & Node.js installieren
RUN apt update && apt install -y \
    git curl ffmpeg bash build-essential \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt install -y nodejs \
    && npm install -g n8n \
    && rm -rf /var/lib/apt/lists/*

# Arbeitsverzeichnis setzen
WORKDIR /workspace

# Anforderungen (optional)
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt || true

# Start-Skript kopieren
COPY start.sh ./start.sh
RUN chmod +x start.sh

# Container starten mit deinem Script
CMD ["./start.sh"]




