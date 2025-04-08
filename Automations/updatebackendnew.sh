#!/bin/bash

# Get current machine's public IP
ipv4_address=$(curl -s ifconfig.me)

# Path to backend .env file
BACKEND_ENV_FILE="../backend/.env"

# Update ALLOWED_HOSTS
if grep -q "ALLOWED_HOSTS" "$BACKEND_ENV_FILE"; then
    sed -i -E "s|^ALLOWED_HOSTS=.*|ALLOWED_HOSTS=127.0.0.1,localhost,${ipv4_address}|g" "$BACKEND_ENV_FILE"
    echo "✅ Updated ALLOWED_HOSTS in backend .env file"
else
    echo "ALLOWED_HOSTS=127.0.0.1,localhost,${ipv4_address}" >> "$BACKEND_ENV_FILE"
    echo "➕ ALLOWED_HOSTS added to backend .env file"
fi
