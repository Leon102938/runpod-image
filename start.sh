#!/bin/bash

# Starte JupyterLab
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root &

# Starte n8n korrekt auf Port 7860
n8n start --port=7860 &

# Starte FastAPI txt2img
uvicorn app.main:app --host 0.0.0.0 --port=8000 &

# Container aktiv lassen
sleep infinity
