#!/bin/bash

# Build script for Script Language VS Code Extension

echo "Building Script Language VS Code Extension..."

# Check if vsce is installed
if ! command -v vsce &> /dev/null; then
    echo "vsce not found. Installing..."
    npm install -g @vscode/vsce
fi

# Package the extension
echo "Packaging extension..."
vsce package

# Get the generated vsix filename
VSIX_FILE=$(ls -t *.vsix | head -1)

if [ -f "$VSIX_FILE" ]; then
    echo "Extension packaged successfully: $VSIX_FILE"
    echo ""
    echo "To install:"
    echo "  VS Code: code --install-extension $VSIX_FILE"
    echo "  Cursor: cursor --install-extension $VSIX_FILE"
    echo ""
    echo "Or install manually through the Extensions view"
else
    echo "Failed to package extension"
    exit 1
fi