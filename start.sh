#!/bin/bash

echo "✅ Starte JupyterLab..."
nohup jupyter lab --ip=0.0.0.0 --port=8888 --no-browser > /workspace/jupyter.log 2>&1 &

echo "✅ Starte N8N..."
nohup n8n > /workspace/n8n.log 2>&1 &

echo "✅ Alle Dienste gestartet. Terminal bereit!"
tail -f /dev/null





