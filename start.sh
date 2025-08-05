#!/bin/bash
set -e

echo "🚀 Starting Hybrid VPN API..."

# Check if PORT is set
if [ -z "$PORT" ]; then
    echo "❌ PORT environment variable is not set"
    echo "Setting default port to 5000"
    export PORT=5000
fi

echo "Port: $PORT"
echo "Python version:"
python --version
echo "Installed packages:"
pip list
echo "Current directory:"
pwd
echo "Files in current directory:"
ls -la

# Test if port is valid
if ! [[ "$PORT" =~ ^[0-9]+$ ]] || [ "$PORT" -lt 1 ] || [ "$PORT" -gt 65535 ]; then
    echo "❌ Invalid port number: $PORT"
    echo "Setting default port to 5000"
    export PORT=5000
fi

echo "Starting gunicorn on port $PORT..."
exec python -m gunicorn --bind 0.0.0.0:$PORT --workers 1 --timeout 120 --log-level debug wsgi:application 