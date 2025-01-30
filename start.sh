#!/bin/bash

echo "Starting Open WebUI containers..."

# Navigate to the script's directory
cd "$(dirname "$0")"

# Start the containers using docker-compose
docker compose up -d

echo "Containers are starting up..."
echo "Waiting for service to be ready..."

# Function to check if the application is fully started
wait_for_startup() {
    local container_name="open-webui"
    local timeout=360  # Maximum wait time in seconds
    local elapsed=0
    
    while [ $elapsed -lt $timeout ]; do
        if docker logs $container_name 2>&1 | grep -q "Application startup complete"; then
            if docker logs $container_name 2>&1 | grep -q "Uvicorn running on http"; then
                return 0
            fi
        fi
        sleep 1
        elapsed=$((elapsed + 1))
        echo -ne "Waiting for service to initialize... ${elapsed}s\r"
    done
    
    echo "Timeout waiting for service to start"
    return 1
}

# Wait for the application to be ready
if wait_for_startup; then
    echo -e "\nService is ready!"
    echo "Opening WebUI at https://localhost"
    # Open the default browser
    xdg-open https://localhost
else
    echo "Failed to start service within timeout period"
    exit 1
fi
