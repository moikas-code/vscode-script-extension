# Quick Publishing Guide

Since you've created the `moikas-code` organization on the marketplace, here's how to publish immediately:

## 1. Login to Marketplace

```bash
# Login with your marketplace publisher
vsce login moikas-code
# Enter your Personal Access Token when prompted
```

## 2. Publish to Marketplace

```bash
# Publish the current version
vsce publish
```

That's it! The extension will be live on the marketplace within minutes.

## 3. Test Installation

Once published, users can install with:
```
ext install moikas-code.script-lang
```

## 4. Set Up GitHub Repository (Optional)

For automatic publishing on future releases:

```bash
# Create repository
gh repo create moikas-code/vscode-script --public

# Push code
git init
git add .
git commit -m "Initial commit: Script VS Code extension"
git remote add origin https://github.com/moikas-code/vscode-script.git
git push -u origin main
```

Then add your Personal Access Token as `VSCE_PAT` secret in GitHub repository settings.

## 5. Future Updates

For future updates:
1. Make changes to the extension
2. Update version: `npm version patch`
3. Publish: `vsce publish`

Or if you set up GitHub Actions:
1. Make changes
2. Create a release on GitHub
3. Automatic publishing!

## Current Extension Details

- **Publisher**: moikas-code
- **Name**: script-lang
- **Install Command**: `ext install moikas-code.script-lang`
- **Homepage**: https://github.com/moikas-code/vscode-script

Users will get automatic updates once installed from the marketplace!