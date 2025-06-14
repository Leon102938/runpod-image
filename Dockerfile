FROM python:3.10-slim

# Install basic tools
RUN apt update && apt install -y bash curl nano git ffmpeg build-essential \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt install -y nodejs \
    && npm install -g n8n \
    && rm -rf /var/lib/apt/lists/*

# Arbeitsverzeichnis
WORKDIR /workspace

# Optional: requirements
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt || true

# Startskript
COPY start.sh ./start.sh
RUN chmod +x start.sh

# Start über dein Script
CMD ["./start.sh"]




