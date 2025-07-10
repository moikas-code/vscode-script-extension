#!/bin/bash

# Create a simple icon for the Script language extension
# This creates a 128x128 PNG with "S" for Script

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "ImageMagick is required to create the icon."
    echo "Install with: sudo apt-get install imagemagick (Ubuntu/Debian)"
    echo "             brew install imagemagick (macOS)"
    exit 1
fi

# Create icon.png
convert -size 128x128 xc:'#1e1e1e' \
        -fill '#3776AB' \
        -draw "circle 64,64 64,10" \
        -fill white \
        -font DejaVu-Sans-Bold \
        -pointsize 72 \
        -gravity center \
        -annotate +0+5 "S" \
        icon.png

echo "Created icon.png (128x128)"

# Create smaller versions if needed
convert icon.png -resize 64x64 icon-64.png
convert icon.png -resize 32x32 icon-32.png

echo "Created additional icon sizes"