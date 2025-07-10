# Setting Up VS Code Marketplace Publishing

Follow these steps to publish the Script extension to the VS Code Marketplace for automatic updates.

## 1. Create Azure DevOps Account

1. Go to [Azure DevOps](https://dev.azure.com)
2. Sign in with Microsoft account (free)
3. Create a new organization if needed

## 2. Create Personal Access Token

1. In Azure DevOps, click your profile → User Settings → Personal Access Tokens
2. Click "New Token"
3. Configure:
   - **Name**: `vsce-script-extension`
   - **Organization**: All accessible organizations
   - **Expiration**: Custom (1 year recommended)
   - **Scopes**: Custom defined → **Marketplace** → **Manage**
4. Click "Create"
5. **COPY THE TOKEN** - you won't see it again!

## 3. Create VS Code Marketplace Publisher

1. Go to [Visual Studio Marketplace Management](https://marketplace.visualstudio.com/manage)
2. Click "Create Publisher"
3. Fill in details:
   - **Publisher ID**: `moikas` (must match package.json)
   - **Display Name**: `Script Language Team`
   - **Email**: Your contact email
   - **Website**: `https://github.com/moikapy/script`

## 4. Set Up GitHub Repository

### Create New Repository
```bash
# Option 1: Create under your account
gh repo create vscode-script --public

# Option 2: Create organization first
gh org create script-lang
gh repo create moikas-code/vscode-script --public
```

### Push Extension Code
```bash
cd vscode-script-extension
git init
git add .
git commit -m "Initial commit: Script VS Code extension"
git remote add origin https://github.com/moikas-code/vscode-script.git
git push -u origin main
```

## 5. Configure GitHub Secrets

1. Go to your repository → Settings → Secrets and variables → Actions
2. Add new secret:
   - **Name**: `VSCE_PAT`
   - **Value**: Your Personal Access Token from step 2

## 6. First Manual Publish

Before automation, test manual publishing:

```bash
# Login to marketplace
vsce login moikas
# Enter your PAT when prompted

# Package and publish
vsce package
vsce publish
```

## 7. Automatic Publishing Setup

The repository already includes GitHub Actions that will:
- Trigger on new releases
- Build the extension
- Publish to marketplace automatically

### Create Your First Release

1. Update version: `npm version patch`
2. Commit: `git add . && git commit -m "chore: release v0.1.1"`
3. Push: `git push`
4. Create release on GitHub:
   - Go to Releases → New Release
   - Tag: `v0.1.1`
   - Title: `v0.1.1`
   - Description: Release notes
   - Publish release

The GitHub Action will automatically publish to the marketplace!

## 8. Verify Publication

1. Check [VS Code Marketplace](https://marketplace.visualstudio.com)
2. Search for "Script Language"
3. Install with: `ext install moikas.script-lang`

## 9. Update Workflow

For future updates:

1. Make changes
2. Update version: `npm version patch|minor|major`
3. Update CHANGELOG.md
4. Commit and push
5. Create GitHub release
6. Automatic publication!

## Troubleshooting

**Error: Publisher not found**
- Ensure `publisher` in package.json matches your marketplace publisher ID

**Error: Token invalid**
- Check token hasn't expired
- Ensure token has Marketplace → Manage scope
- Re-create token if needed

**Error: Extension already exists**
- Version must be higher than current marketplace version
- Use `npm version patch` to increment

**Extension not showing in marketplace**
- Can take up to 24 hours for new extensions
- Check publisher approval status

## Important Notes

- **Keep PAT secure** - it has publishing rights
- **Test locally first** - marketplace publishes can't be undone easily
- **Version carefully** - marketplace won't accept duplicate versions
- **Update docs** - keep README and CHANGELOG current

## Support

- [VS Code Extension Publishing Guide](https://code.visualstudio.com/api/working-with-extensions/publishing-extension)
- [vsce CLI Documentation](https://github.com/microsoft/vscode-vsce)