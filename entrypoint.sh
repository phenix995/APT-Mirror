#!/bin/bash

# Exit on any error
set -e

# Function to handle termination signals
trap 'echo "Stopping APT mirror"; exit 0' SIGTERM SIGINT

echo "Starting Nginx..."
nginx -g 'daemon off;' &

echo "Running apt-mirror..."
apt-mirror

# Wait for all background processes to finish
wait
