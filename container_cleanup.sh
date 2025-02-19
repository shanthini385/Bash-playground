#!/bin/bash
# Container Cleanup and Maintenance
# This script cleans up unused Docker containers, images, volumes, and networks.

echo "Pruning stopped containers..."
docker container prune -f

echo "Pruning unused images..."
docker image prune -a -f

echo "Pruning unused volumes..."
docker volume prune -f

echo "Pruning unused networks..."
docker network prune -f

echo "Docker cleanup complete."
