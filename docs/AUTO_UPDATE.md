# Auto-Update Information for Script VS Code Extension

## How Auto-Updates Work

### For Users

**The Script VS Code extension updates automatically!** Here's what you need to know:

1. **Default Behavior**: 
   - VS Code checks for extension updates periodically
   - Updates download and install automatically
   - You'll see a notification when the extension updates

2. **Update Notifications**:
   - When updated, you'll see: "Script Language Support updated to vX.X.X"
   - Click "View Changelog" to see what's new

3. **Control Updates**:
   ```json
   // In VS Code settings.json
   
   // Disable ALL extension auto-updates:
   "extensions.autoUpdate": false,
   
   // Or just disable update notifications for Script:
   "script.showUpdateNotifications": false
   ```

4. **Manual Update Check**:
   - Open Extensions view (Ctrl+Shift+X)
   - Click the update icon in the top toolbar
   - Or use Command Palette: "Extensions: Check for Extension Updates"

### For Developers

**How to Release Updates**:

1. **Update Version**:
   ```bash
   # Bump version in package.json
   npm version patch  # 0.1.0 -> 0.1.1
   npm version minor  # 0.1.0 -> 0.2.0
   npm version major  # 0.1.0 -> 1.0.0
   ```

2. **Update CHANGELOG.md**:
   ```markdown
   ## [0.2.0] - 2025-01-15
   ### Added
   - New feature X
   ### Fixed
   - Bug Y
   ```

3. **Commit and Tag**:
   ```bash
   git add .
   git commit -m "chore: release v0.2.0"
   git tag v0.2.0
   git push && git push --tags
   ```

4. **Create GitHub Release**:
   - Go to GitHub → Releases → New Release
   - Select the tag
   - GitHub Actions automatically publishes to marketplace

5. **Users Get Update**:
   - Within 24 hours (VS Code's update check cycle)
   - Or immediately if they manually check

## Update Features in Extension

The extension includes smart update handling:

1. **First Install Detection**:
   - Shows welcome message with link to docs

2. **Update Detection**:
   - Shows what's new with link to changelog

3. **Version Tracking**:
   - Remembers last version to show update notes only once

## Best Practices

### For Version Numbers
- **Patch** (0.1.0 → 0.1.1): Bug fixes, typos
- **Minor** (0.1.0 → 0.2.0): New features, improvements
- **Major** (0.1.0 → 1.0.0): Breaking changes, major features

### For Changelog
- Always update CHANGELOG.md
- Use clear categories: Added, Changed, Fixed, Removed
- Include migration notes for breaking changes

### For Users
- Keep auto-update enabled for security fixes
- Check changelog for new features
- Report issues if updates cause problems

## Troubleshooting

**Extension not updating?**
1. Check VS Code settings for disabled auto-update
2. Manually check for updates
3. Restart VS Code
4. Reinstall extension if needed

**Want to downgrade?**
1. Uninstall current version
2. Download older .vsix from GitHub releases
3. Install specific version manually

## Update Schedule

- **Bug fixes**: Released as soon as fixed
- **Features**: Bundled in minor releases
- **Security**: Released immediately
- **Major changes**: Announced in advance