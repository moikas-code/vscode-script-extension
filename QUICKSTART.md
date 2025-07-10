# Quick Start Guide for Script VS Code Extension Users

## For Extension Users

### Install from VS Code Marketplace (When Published)

1. Open VS Code or Cursor
2. Go to Extensions (Ctrl+Shift+X / Cmd+Shift+X)
3. Search for "Script Language"
4. Click Install on "Script Language Support"
5. Reload VS Code if prompted

### Install from GitHub Release

1. Go to [Releases](https://github.com/script-lang/vscode-script/releases)
2. Download the latest `.vsix` file
3. In VS Code: 
   - Open Command Palette (Ctrl+Shift+P / Cmd+Shift+P)
   - Type "Install from VSIX"
   - Select the downloaded file

### Install from Source

```bash
# Clone the repository
git clone https://github.com/script-lang/vscode-script.git
cd vscode-script

# Install dependencies
npm install

# Package the extension
npm run package

# Install the extension
code --install-extension script-lang-*.vsix
```

## For Repository Maintainers

### Initial Setup as New GitHub Repository

1. **Create a new GitHub organization** (recommended): `script-lang`
   - This gives a professional namespace
   - Allows multiple maintainers

2. **Fork or copy the extension files**:
   ```bash
   # Copy the vscode-script-extension folder to a new location
   cp -r vscode-script-extension /path/to/new/vscode-script
   cd /path/to/new/vscode-script
   ```

3. **Initialize Git repository**:
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Script VS Code extension"
   ```

4. **Create GitHub repository**:
   - Go to https://github.com/new
   - Name: `vscode-script`
   - Make it public
   - Don't initialize with README

5. **Push to GitHub**:
   ```bash
   git remote add origin https://github.com/script-lang/vscode-script.git
   git branch -M main
   git push -u origin main
   ```

6. **Set up marketplace publisher**:
   - Go to https://marketplace.visualstudio.com/manage
   - Create publisher: `script-lang`
   - Get Personal Access Token (see SETUP_GITHUB.md)

7. **Configure GitHub Secrets**:
   - Add `VSCE_PAT` secret with your token

8. **Create first release**:
   - Go to GitHub releases
   - Create new release
   - Tag: v0.1.0
   - This triggers automatic publishing

### Ongoing Maintenance

1. **Update version**:
   ```bash
   npm version patch  # or minor/major
   ```

2. **Update CHANGELOG.md**

3. **Commit and push**:
   ```bash
   git add .
   git commit -m "chore: release v0.1.1"
   git push
   ```

4. **Create release**:
   - Go to GitHub releases
   - Create new release with new version tag
   - Auto-publishes to marketplace

## Icon Customization

The extension needs an icon. Either:

1. Use the provided script:
   ```bash
   ./create-icon.sh
   ```

2. Or create your own 128x128 PNG as `icon.png`

## Testing During Development

1. Open the extension folder in VS Code
2. Press F5 to launch Extension Development Host
3. Open any `.script` file to test
4. Check syntax highlighting works
5. Test all language features

## Useful Links

- [Script Language Repo](https://github.com/moikapy/script)
- [VS Code Extension API](https://code.visualstudio.com/api)
- [TextMate Grammar Guide](https://macromates.com/manual/en/language_grammars)