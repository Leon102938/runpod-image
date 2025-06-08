# Dockerfile
FROM python:3.10-slim

# Systemabhängigkeiten
RUN apt update && apt install -y git curl ffmpeg && rm -rf /var/lib/apt/lists/*

# Arbeitsverzeichnis
WORKDIR /workspace

# Python Requirements installieren
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Projektdateien kopieren
COPY . /workspace

# Start-Script ausführen
CMD ["bash", "start.sh"]
