# WEBUI Docker Compose Setup

This repository contains a Docker Compose configuration for running WEBUI with your local Ollama instance.

## Prerequisites

- Docker
- Docker Compose
- Ollama running locally on port 11434

## Getting Started

1. Ensure Ollama is running on your local machine

2. Start WEBUI:
   ```bash
   docker compose up -d
   ```

3. Access WEBUI at:
   ```
   http://localhost:3000
   ```

## Data Persistence and Backup

All WEBUI data is stored in the `./data` directory, including:
- User accounts and authentication
- Chat history and conversations
- Database files
- User preferences and settings
- Custom configurations

To backup your WEBUI installation:
1. Copy the `data` directory
2. Keep your `docker-compose.yml` file

To restore:
1. Place `docker-compose.yml` in the desired location
2. Copy your backed-up `data` directory to the same location
3. Run `docker compose up -d`

## Stopping the Service

To stop WEBUI:
```bash
docker compose down
```

To stop and remove volume:
```bash
docker compose down -v
```
