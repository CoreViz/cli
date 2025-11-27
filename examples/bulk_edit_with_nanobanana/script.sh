#!/bin/bash

# Loop through all image files
for file in *.jpg *.png *.jpeg *.webp; do
    [ -e "$file" ] || continue

    echo "Processing $file..."

    # Extract jersey number using coreviz tag with --quiet
    jersey_number=$(npx @coreviz/cli edit "$file" --prompt "make it cyberpunk style")

    echo "  Edited image: $edited_image"
done
