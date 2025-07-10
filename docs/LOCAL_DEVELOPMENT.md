# Local Development and Updates

## Local Builds Do NOT Auto-Update

When you build and install the extension locally (via .vsix or folder copy), it will **NOT** auto-update because:

1. VS Code only auto-updates extensions from the marketplace
2. Local extensions have no update source to check
3. Manual installations bypass the marketplace update system

## Development Workflows

### 1. Active Development (Recommended)
```bash
# Open extension folder in VS Code
code vscode-script-extension

# Press F5 to launch Extension Development Host
# Changes are reflected immediately in the test instance
# No need to "update" - just edit and test!
```

### 2. Local Testing with Updates
```bash
# Use the provided update script
./update-local.sh

# This will:
# - Remove old version
# - Build new version  
# - Install the new .vsix
# - Work for both VS Code and Cursor
```

### 3. Symlink Method (Advanced)
```bash
# Create a symlink to your development folder
ln -s /path/to/vscode-script-extension ~/.vscode/extensions/script-lang-dev

# Now changes are reflected after VS Code restart
# But you need to manually run `npm run compile`
```

## Comparison Table

| Method | Auto-Update | Pros | Cons |
|--------|------------|------|------|
| **Marketplace** | ✅ Yes | Automatic, easy | Need to publish |
| **Local .vsix** | ❌ No | Full control | Manual updates |
| **F5 Debug** | N/A | Instant changes | Only for development |
| **Symlink** | ❌ No | Quick iteration | Manual compile |

## When to Use Each Method

- **Marketplace**: Production users, automatic updates
- **GitHub Releases**: Beta testers, controlled updates  
- **Local Build**: Development, testing, customization
- **F5 Debug**: Active development, debugging

## Setting Up Auto-Updates

To get auto-updates, you must:

1. **Publish to VS Code Marketplace**:
   ```bash
   vsce publish
   ```

2. **Users install from marketplace**:
   ```
   ext install script-lang.script-lang
   ```

3. **Updates flow automatically**:
   - You publish new version → Users get it automatically

## FAQ

**Q: Can I make local builds auto-update?**
A: No, but you can use the `update-local.sh` script or develop with F5.

**Q: How do I test updates before publishing?**
A: 
1. Build locally and test
2. Share .vsix with beta testers
3. Publish to marketplace when ready

**Q: Can I have both local and marketplace versions?**
A: Yes, but only one can be active. VS Code will prefer the marketplace version.

**Q: How often does VS Code check for updates?**
A: Every few hours, or manually via "Extensions: Check for Extension Updates"