#!/usr/bin/env bash
set -e

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

git config user.email "dawehner@googlemail.com"
git config user.name "Daniel Wehner"

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

if git diff --cached --quiet; then
  echo "No changes to commit, skipping."
else
  git commit -m "$msg"
  # Push source and build repos.
  git push -f origin HEAD:master
fi

# Come Back up to the Project Root
cd ..