#!/bin/bash
set -e

echo "--- Debugging Entrypoint ---"
echo "Current user: $(id -un)"
echo "Current user ID: $(id -u)"
echo "Environment variables:"
env

# Keep the container alive for inspection
sleep infinity
