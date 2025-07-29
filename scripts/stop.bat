@echo off
cd /d "%~dp0.."
docker compose -f n8n-docker-compose.yaml stop