#!/bin/bash

echo ">>> Starte JupyterLab..."
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root > /workspace/jupyter.log 2>&1 &

echo ">>> Starte N8N..."
n8n start --port=7860 > /workspace/n8n.log 2>&1 &

echo ">>> Starte txt2img FastAPI..."
uvicorn app.main:app --host 0.0.0.0 --port=8000 > /workspace/txt2img.log 2>&1 &

echo ">>> Alle Dienste wurden gestartet."
echo ">>> Logs:"
echo "  - Jupyter:   tail -f /workspace/jupyter.log"
echo "  - N8N:       tail -f /workspace/n8n.log"
echo "  - txt2img:   tail -f /workspace/txt2img.log"

# Terminal offen halten (und gleichzeitig CPU freundlich blockieren)
tail -f /dev/null


