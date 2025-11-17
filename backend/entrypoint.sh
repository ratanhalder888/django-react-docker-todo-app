#!/bin/sh

# entrypoint.sh

# Exit on error
set -e

echo "=== Starting Django Application ==="

# Wait for the PostgreSQL database to be ready
echo "Waiting for postgres..."

while ! nc -z $DB_HOST $DB_PORT; do
  sleep 0.1
done

echo "PostgreSQL started"

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate --noinput

# Collect static files (if necessary, though already in Dockerfile)
# echo "Collecting static files..."
python manage.py collectstatic --noinput

# Start Gunicorn server
echo "Starting Gunicorn server..."
# Using 'exec' ensures signals (like SIGINT/SIGTERM) are passed correctly to Gunicorn
exec gunicorn backend.wsgi:application --bind 0.0.0.0:8000 --workers 3 --timeout 120