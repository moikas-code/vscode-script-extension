# Setting Up Script VS Code Extension on GitHub

This guide explains how to set up the Script VS Code extension as a GitHub repository and publish it for others to use.

## Step 1: Create GitHub Repository

1. Go to [GitHub](https://github.com/new)
2. Repository name: `vscode-script`
3. Description: "VS Code extension for the Script programming language"
4. Make it public
5. Initialize with README: No (we have one)
6. Create repository

## Step 2: Push Code to GitHub

```bash
# In the vscode-script-extension directory
git init
git add .
git commit -m "Initial commit: Script VS Code extension"
git branch -M main
git remote add origin https://github.com/YOUR_ORG/vscode-script.git
git push -u origin main
```

## Step 3: Create Extension Icon

Create a 128x128 PNG icon and save it as `icon.png` in the root directory.

## Step 4: Set Up VS Code Marketplace

### Create Publisher

1. Go to [Visual Studio Marketplace](https://marketplace.visualstudio.com/manage)
2. Create a new publisher with ID: `script-lang`
3. Fill in publisher details

### Get Personal Access Token

1. Go to [Azure DevOps](https://dev.azure.com)
2. Click on User Settings → Personal Access Tokens
3. Create new token with:
   - Name: `vsce-publish`
   - Organization: All accessible organizations
   - Expiration: 90 days (or custom)
   - Scopes: Custom defined → Marketplace → Manage

### Add Token to GitHub Secrets

1. In your GitHub repo, go to Settings → Secrets and variables → Actions
2. Add new secret:
   - Name: `VSCE_PAT`
   - Value: Your Personal Access Token

## Step 5: First Publish

### Option A: Publish from Local

```bash
# Install vsce globally
npm install -g @vscode/vsce

# Login with your publisher
vsce login script-lang

# Package the extension
vsce package

# Publish to marketplace
vsce publish
```

### Option B: Publish via GitHub Actions

1. Create a new release on GitHub
2. The publish workflow will automatically run
3. Extension will be published to marketplace

## Step 6: Update Documentation

Update the README.md with:
- Marketplace badges
- Installation instructions
- Link to marketplace page

## Step 7: Share with Users

Users can now install the extension:

### From Marketplace
```
ext install script-lang.script-lang
```

### From GitHub Releases
Download the `.vsix` file from releases and install manually.

## Maintenance

### Updating the Extension

1. Make changes
2. Update version in `package.json`
3. Update `CHANGELOG.md`
4. Commit and push
5. Create a new release on GitHub
6. GitHub Actions will automatically publish

### Manual Publishing

```bash
# Update version
npm version patch  # or minor/major

# Package and publish
vsce publish
```

## Troubleshooting

**Error: Missing publisher name**
- Ensure `publisher` field in package.json matches your marketplace publisher ID

**Error: Personal Access Token**
- Token might be expired, create a new one
- Ensure token has Marketplace → Manage scope

**Error: Icon missing**
- Add a 128x128 PNG icon named `icon.png` to the root

## Next Steps

1. Set up issue templates
2. Add more detailed documentation
3. Consider adding:
   - Code snippets
   - Language server support
   - Debugging configuration
   - More comprehensive grammar rules