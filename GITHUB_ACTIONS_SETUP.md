# GitHub Actions Setup for Automatic Publishing

Your extension is now on GitHub with automated publishing! Here's how to complete the setup:

## 🚀 Repository Status: ✅ COMPLETE
- **Repository**: https://github.com/moikas-code/vscode-script-extension
- **GitHub Actions**: ✅ Configured
- **Auto-publishing**: ✅ Ready (needs token)

## 🔑 Final Step: Add Marketplace Token

### 1. Get Your Personal Access Token
You should already have this from setting up the `moikas-code` publisher on the marketplace.

### 2. Add Token to GitHub Secrets
1. Go to: https://github.com/moikas-code/vscode-script-extension/settings/secrets/actions
2. Click "New repository secret"
3. Name: `VSCE_PAT`
4. Value: Your Personal Access Token
5. Click "Add secret"

## 🔄 How Auto-Publishing Works

### Manual Publishing (Right Now)
```bash
# Login and publish immediately
vsce login moikas-code
vsce publish
```

### Automatic Publishing (After Setup)
1. Make changes to the extension
2. Update version: `npm version patch`
3. Commit and push changes
4. Create a GitHub release
5. **GitHub Actions automatically publishes to marketplace!**

### Example Update Workflow
```bash
# Make your changes...
npm version patch               # 0.1.0 -> 0.1.1
git add .
git commit -m "feat: add new feature"
git push

# Create release on GitHub web interface
# OR use GitHub CLI:
gh release create v0.1.1 --title "v0.1.1" --notes "Bug fixes and improvements"
```

## 📦 What GitHub Actions Do

### CI Workflow (`.github/workflows/ci.yml`)
**Triggers**: Every push and pull request
- ✅ Install dependencies
- ✅ Run tests
- ✅ Build extension
- ✅ Upload .vsix as artifact

### Publish Workflow (`.github/workflows/publish.yml`)  
**Triggers**: New releases
- ✅ Build extension
- ✅ Publish to VS Code Marketplace
- ✅ Users get automatic updates

## 🎯 Testing the Setup

### Test CI (Should Work Now)
1. Make a small change to README.md
2. Push to GitHub
3. Check "Actions" tab - CI should run and pass

### Test Publishing (After Adding Token)
1. Add the `VSCE_PAT` secret
2. Create a test release:
   ```bash
   npm version patch
   git add . && git commit -m "chore: test release"
   git push
   gh release create v0.1.1 --title "Test Release" --notes "Testing auto-publish"
   ```
3. Check Actions tab - Publish workflow should run
4. Check marketplace - Extension should update

## 🛠️ Troubleshooting

**Actions failing?**
- Check if `VSCE_PAT` secret is added correctly
- Verify token has Marketplace → Manage permissions
- Ensure token hasn't expired

**Version conflicts?**
- Marketplace won't accept duplicate versions
- Always increment version before publishing
- Use `npm version patch|minor|major`

**Extension not updating for users?**
- Updates can take up to 24 hours to propagate
- Users can manually check: "Extensions: Check for Extension Updates"

## 📈 Current Status

✅ **Repository**: Created and pushed
✅ **GitHub Actions**: Configured
✅ **Documentation**: Complete
⏳ **Token Setup**: Needs `VSCE_PAT` secret
⏳ **First Release**: Ready to create

## 🎉 Next Steps

1. **Add the `VSCE_PAT` secret** (5 minutes)
2. **Create first release** to test auto-publishing
3. **Users can install with**: `ext install moikas-code.script-lang`
4. **Enjoy automatic updates** for all future releases!

Your Script VS Code extension is now ready for professional distribution! 🚀