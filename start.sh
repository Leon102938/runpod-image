#!/bin/bash

echo ">>> Starte JupyterLab..."
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root > jupyter.log 2>&1 &

echo ">>> Starte N8N..."
n8n start --port=7860 > n8n.log 2>&1 &

echo ">>> Starte txt2img FastAPI..."
uvicorn app.main:app --host 0.0.0.0 --port=8000 > txt2img.log 2>&1 &

echo ">>> Alle Dienste laufen. Starte Bash für Terminal-Zugriff..."
exec bash
