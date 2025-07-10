#!/bin/bash
# Script to update locally installed Script VS Code extension

echo "Updating Script VS Code Extension..."

# Get the extensions directory
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    EXT_DIR="$HOME/.vscode/extensions"
    CURSOR_DIR="$HOME/.cursor/extensions"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    EXT_DIR="$HOME/.vscode/extensions"
    CURSOR_DIR="$HOME/.cursor/extensions"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows
    EXT_DIR="$APPDATA/Code/User/extensions"
    CURSOR_DIR="$APPDATA/Cursor/User/extensions"
fi

# Remove old version
echo "Removing old version..."
rm -rf "$EXT_DIR"/script-lang-*
rm -rf "$CURSOR_DIR"/script-lang-*

# Build new version
echo "Building new version..."
npm install
npm run compile
vsce package

# Get the generated vsix file
VSIX_FILE=$(ls -t *.vsix | head -1)

if [ -f "$VSIX_FILE" ]; then
    echo "Installing new version..."
    code --install-extension "$VSIX_FILE"
    
    # For Cursor users
    if command -v cursor &> /dev/null; then
        cursor --install-extension "$VSIX_FILE"
    fi
    
    echo "✅ Update complete! Restart VS Code/Cursor."
else
    echo "❌ Failed to build extension"
    exit 1
fi