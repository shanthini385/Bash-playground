#!/bin/bash
# Continuous Deployment Pipeline
# This script automates pulling the latest code, building, testing, and deploying an application.

# Configuration
REPO_DIR="/path/to/your/repo"
DEPLOY_DIR="/path/to/deployment"
BRANCH="main"

# Change to repository directory
cd "$REPO_DIR" || { echo "Repository directory not found!"; exit 1; }

# Update repository code
echo "Checking out branch $BRANCH..."
git checkout "$BRANCH"
echo "Pulling latest changes..."
git pull origin "$BRANCH"

# Build step (customize with your build command)
echo "Building the project..."
if ! ./build.sh; then
    echo "Build failed. Aborting deployment."
    exit 1
fi

# Test step (customize with your test command)
echo "Running tests..."
if ! ./run_tests.sh; then
    echo "Tests failed. Aborting deployment."
    exit 1
fi

# Deployment step (customize as needed; here we use rsync)
echo "Deploying application..."
rsync -avz --delete "$REPO_DIR/" "$DEPLOY_DIR/"

echo "Deployment successful."
