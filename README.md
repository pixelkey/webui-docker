# Open WebUI Docker Setup with HTTPS

This repository contains a Docker setup for running Open WebUI with your local Ollama instance, featuring both HTTP and HTTPS access.

## Prerequisites

- Docker Desktop (for macOS)
- Ollama installed and running locally
- Ports 3000, 80, and 443 available on your machine

## Quick Start

1. Start Ollama:
   ```bash
   ollama serve
   ```

2. Start Open WebUI:
   ```bash
   docker compose up -d
   ```

3. Access the UI:
   - HTTP: `http://localhost:3000`
   - HTTPS: `https://localhost`

   Note: For HTTPS, you'll need to accept the self-signed certificate in your browser.

## Data Storage

All data is stored in Docker volumes:
- `open-webui`: Contains WebUI data (chat history, settings, etc.)
- `caddy_data`: Caddy SSL certificates
- `caddy_config`: Caddy configuration

## Backup and Restore

To backup your data:
```bash
docker run --rm -v open-webui:/source -v $(pwd):/backup alpine tar czf /backup/open-webui-backup.tar.gz -C /source .
```

To restore:
```bash
docker run --rm -v open-webui:/target -v $(pwd):/backup alpine sh -c "cd /target && tar xzf /backup/open-webui-backup.tar.gz"
```

## Troubleshooting

### Connection Issues
- Verify Ollama is running:
  ```bash
  curl http://localhost:11434/api/tags
  ```
- Check container logs:
  ```bash
  docker compose logs webui
  ```

### HTTPS Issues
- Ensure ports 80 and 443 aren't in use
- Accept the self-signed certificate in your browser
- Check Caddy logs:
  ```bash
  docker compose logs caddy
  ```

### Blank Screen After Login
1. Verify Docker Desktop is running (macOS)
2. Check Ollama is accessible
3. Restart the containers:
   ```bash
   docker compose restart
   ```

## Commands Reference

Start services:
```bash
docker compose up -d
```

Stop services:
```bash
docker compose down
```

View logs:
```bash
docker compose logs -f
```

Remove all data (warning: destructive):
```bash
docker compose down -v
