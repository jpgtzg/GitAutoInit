#!/bin/bash

echo "GitHub CLI is required to run GitAuto. It will be installed if not already in the machine."

# Check if gh is installed
if ! command -v gh &> /dev/null
then
    echo "Installing GitHub CLI..."
    sudo dnf install -y gh
else
    echo "GitHub CLI is already installed."
fi

echo "GitHub CLI is working."

# Initialize git
git init -b main
git add .
git commit -m "Initial Commit via GitAuto"

# Get repo visibility
read -p "Enter commit status [private/public]: " status

# Get local directory path
read -p "Enter local commit directory: " directory

# Create GitHub repo
gh repo create --$status --source="$directory" --remote=upstream --push

echo "Finished running GitAuto"
