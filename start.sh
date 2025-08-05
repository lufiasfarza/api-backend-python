#!/bin/bash
echo "🚀 Starting Hybrid VPN API..."
echo "Port: $PORT"
echo "Python version:"
python --version
echo "Installed packages:"
pip list --user
echo "Starting gunicorn..."
exec python -m gunicorn --bind 0.0.0.0:$PORT --workers 1 --timeout 120 wsgi:application 