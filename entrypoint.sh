#!/bin/bash

# Start nginx to begin serving the mirror
echo "Starting webserver"
nginx -g 'daemon off;' &


wait