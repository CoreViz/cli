#!/bin/bash

# Loop through all image files
for file in *.jpg *.png *.jpeg *.webp; do
    [ -e "$file" ] || continue

    echo "Processing $file..."

    # Extract jersey number using coreviz tag with --quiet
    jersey_number=$(npx @coreviz/cli tag "$file" "What is the player's jersey number? Return only the number." \
        --single \
        --mode local \
        --quiet)

    if [ -n "$jersey_number" ]; then
        echo "  Found jersey number: $jersey_number"
        mkdir -p "player_$jersey_number"
        mv "$file" "player_$jersey_number/"
    else
        echo "  Could not detect jersey number for $file"
    fi
done
