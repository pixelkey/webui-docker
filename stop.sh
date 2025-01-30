#!/bin/bash

echo "Stopping Open WebUI containers..."

# Navigate to the script's directory
cd "$(dirname "$0")"

# Stop the containers using docker-compose
docker compose down

echo "Containers have been stopped."
