#!/bin/bash
set -e

echo "🚀 Starting Hybrid VPN API..."

# Debug environment variables
echo "=== Environment Variables ==="
env | grep -E "(PORT|RAILWAY)" || echo "No PORT or RAILWAY variables found"

# Check if PORT is set
if [ -z "$PORT" ]; then
    echo "❌ PORT environment variable is not set"
    echo "Setting default port to 8080"
    export PORT=8080
else
    echo "✅ PORT is set to: $PORT"
fi

echo "=== System Info ==="
echo "Python version:"
python --version
echo "Current directory:"
pwd
echo "Files in current directory:"
ls -la

# Test if port is valid
if ! [[ "$PORT" =~ ^[0-9]+$ ]] || [ "$PORT" -lt 1 ] || [ "$PORT" -gt 65535 ]; then
    echo "❌ Invalid port number: $PORT"
    echo "Setting default port to 8080"
    export PORT=8080
fi

echo "=== Starting Application ==="
echo "Starting gunicorn on port $PORT..."
echo "Command: python -m gunicorn --bind 0.0.0.0:$PORT --workers 1 --timeout 120 --log-level debug wsgi:application"

exec python -m gunicorn --bind 0.0.0.0:$PORT --workers 1 --timeout 120 --log-level debug wsgi:application 