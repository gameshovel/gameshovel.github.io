#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <message> <downForHours>"
  exit 1
fi

# Assign arguments to variables
MESSAGE=$1
DOWN_FOR_HOURS=$2

# Get the current Unix epoch time
DOWN_AT=$(date +%s)

# Update the status.json file
cat <<EOF > src/status.json
{
  "message": "$MESSAGE",
  "downAt": $DOWN_AT,
  "downForHours": $DOWN_FOR_HOURS
}
EOF

echo "src/status.json has been updated."

# Commit the changes to Git
git add src/status.json
git commit -m "Update src/status.json: $MESSAGE, down for $DOWN_FOR_HOURS hours starting at $DOWN_AT"
git push

echo "Changes have been committed and pushed to Git."