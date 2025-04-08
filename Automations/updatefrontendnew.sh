#!/bin/bash

# Get current machine's public IP
ipv4_address=$(curl -s ifconfig.me)

# Path to .env file in frontend
ENV_FILE_PATH="../frontend/.env.docker"

# Target API path
NEW_API_PATH="VITE_API_PATH=\"http://${ipv4_address}:31100\""

# Check and update
if grep -q "VITE_API_PATH" "$ENV_FILE_PATH"; then
    sed -i -e "s|^VITE_API_PATH.*|$NEW_API_PATH|g" "$ENV_FILE_PATH"
    echo "✅ Updated .env.docker with new IP: $ipv4_address"
else
    echo "$NEW_API_PATH" >> "$ENV_FILE_PATH"
    echo "➕ VITE_API_PATH added to .env.docker"
fi
