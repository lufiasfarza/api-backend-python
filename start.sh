#!/bin/bash
echo "🚀 Starting Hybrid VPN API..."
echo "Port: $PORT"
echo "Python version:"
python --version
echo "Installed packages:"
pip list
echo "Current directory:"
pwd
echo "Files in current directory:"
ls -la
echo "Starting gunicorn..."
exec python -m gunicorn --bind 0.0.0.0:$PORT --workers 1 --timeout 120 --log-level debug wsgi:application 