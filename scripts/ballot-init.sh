#!/usr/bin/env bash

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <github-username> <draft-version>"
    echo "Example: $0 or13 draft-ietf-example-01"
    exit 1
fi


AUTHOR_NAME="$1"
DRAFT_VERSION="$2"
DRAFT="${DRAFT_VERSION%-*}"  # Remove everything after the last hyphen
TEMPLATE_FILE="templates/iesg-evaluation-$AUTHOR_NAME.md"
TARGET_DIR="iesg-evaluation/$DRAFT_VERSION"
TARGET_FILE="$TARGET_DIR/ballot-$AUTHOR_NAME.md"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Check if the template file exists
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file $TEMPLATE_FILE not found"
    exit 1
fi

# Copy the template file to the new location
cp "$TEMPLATE_FILE" "$TARGET_FILE"

# Check if the OS is macOS (Darwin)
# Replace DRAFT with DRAFT_VERSION in the target file
if [[ "$(uname)" == "Darwin" ]]; then
  sed -i '' "s/DRAFT/$DRAFT_VERSION/g" "$TARGET_FILE"
else
  sed -i "s/DRAFT/$DRAFT_VERSION/g" "$TARGET_FILE"
fi

# Download the URL using curl and save it to the download directory
curl -s -o "$TARGET_DIR/idnits-report.txt" "https://author-tools.ietf.org/api/idnits?url=https://www.ietf.org/archive/id/$DRAFT_VERSION.txt&submitcheck=True"

# Download the URL using curl and save it to the download directory
curl -s "https://datatracker.ietf.org/doc/$DRAFT/shepherdwriteup/" | \
    sed -n '/<pre class="border p-3 my-3">/,/<\/pre>/p' | \
    sed '1s/<pre class="border p-3 my-3">//' | \
    sed '$d' | \
    sed 's/^[[:space:]]*//;s/[[:space:]]*$//' > "$TARGET_DIR/shepherdwriteup.txt"

# Add some fun elements at the end
echo -e "\n🔬🧪 Ballot initialization complete! \a"

