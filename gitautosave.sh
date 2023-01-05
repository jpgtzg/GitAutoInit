#! /bin/bash

echo "Github CLI is required to run GitAuto. It will be installed if not already in the machine" 
brew install gh
echo "Github CLI working"
git init -b main
git add .
git commit -m "Initial Commit via GitAuto"
echo "Enter commit status [private/public]"
read status
echo "Enter local commit directory"
read directory
gh repo create --$status --source=$directory
echo "Finished running GitAuto" 
