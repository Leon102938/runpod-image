#!/bin/bash

echo ">>> Starte Server v1.8 – Build vom 15. Juni um 12.13 Uhr"
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='' > /workspace/jupyter.log 2>&1 &

echo ">>> Starte N8N..."
n8n start --port=7860 > /workspace/n8n.log 2>&1 &

echo ">>> Starte txt2img FastAPI..(Test123 neu!)."
uvicorn app.main:app --host 0.0.0.0 --port=8000 > /workspace/txt2img.log 2>&1 &

sleep 5
echo ">>> Dienste laufen ✅"
echo ">>> Logs:"
cat /workspace/jupyter.log || echo "⚠️ Jupyter-Log fehlt"
cat /workspace/n8n.log || echo "⚠️ N8N-Log fehlt"
cat /workspace/txt2img.log || echo "⚠️ txt2img-Log fehlt"




