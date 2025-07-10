# Script Language VS Code Extension

[![CI](https://github.com/moikas-code/vscode-script-extension/actions/workflows/ci.yml/badge.svg)](https://github.com/moikas-code/vscode-script-extension/actions/workflows/ci.yml)
![Version](https://img.shields.io/visual-studio-marketplace/v/moikas-code.script-lang)
![Downloads](https://img.shields.io/visual-studio-marketplace/d/moikas-code.script-lang)
![Rating](https://img.shields.io/visual-studio-marketplace/r/moikas-code.script-lang)

Official VS Code extension for the [Script programming language](https://github.com/moikapy/script) - an AI-native language with production-grade generics, pattern matching, and memory safety.

This extension provides language support for the Script programming language in VS Code and Cursor.

## Features

- 🎨 **Syntax Highlighting**: Full syntax highlighting for all Script language constructs
- 🔧 **Language Configuration**: Auto-closing brackets, comment toggling, smart indentation
- 📁 **File Recognition**: `.script` files automatically recognized
- 🎯 **Language ID**: Proper `script` language identifier for other extensions
- 💡 **Coming Soon**: Language Server Protocol support (85% complete)

## Installation

### Method 1: VS Code Marketplace (Recommended)

1. Open VS Code or Cursor
2. Press `Ctrl+P` / `Cmd+P`
3. Type `ext install moikas-code.script-lang`
4. Press Enter and click Install

**✨ Auto-Updates**: Once installed, the extension updates automatically when new versions are released!

### Method 2: GitHub Release

1. Download the latest `.vsix` file from [Releases](https://github.com/moikas-code/vscode-script-extension/releases)
2. In VS Code: Extensions → ... → Install from VSIX
3. Select the downloaded file

### Method 3: Build from Source

1. Copy the `vscode-script-extension` folder to your VS Code extensions directory:
   - **Windows**: `%USERPROFILE%\.vscode\extensions\`
   - **macOS/Linux**: `~/.vscode/extensions/`
   - **Cursor**: Same locations but replace `.vscode` with `.cursor`

2. Restart VS Code/Cursor

1. Clone the repository:
   ```bash
   git clone https://github.com/moikas-code/vscode-script-extension.git
   cd vscode-script
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Package the extension:
   ```bash
   npm run package
   ```

4. Install the generated .vsix file:
   ```bash
   code --install-extension script-lang-*.vsix
   ```

## Usage

Once installed:
- `.script` files will be recognized with the `script` language ID
- Syntax highlighting will work automatically
- File icons will appear in the explorer (may need icon theme support)

## Configuration

To improve icon support with popular icon themes:

**Material Icon Theme:**
```json
"material-icon-theme.languages.associations": {
  "script": "javascript"
}
```

**vscode-icons:**
```json
"vsicons.associations.files": [
  { "icon": "script", "extensions": ["script"], "format": "svg" }
]
```

## Syntax Examples

```script
// Function definition
fn main() {
    print("Hello, Script!")
}

// Variables and types
let name: string = "Script"
let version: f32 = 0.5
let features = ["generics", "pattern matching", "memory safety"]

// Pattern matching
match result {
    Ok(value) => print("Success: ${value}"),
    Err(error) => print("Error: ${error}")
}

// Generics
fn map<T, U>(items: Array<T>, transform: fn(T) -> U) -> Array<U> {
    // Implementation
}

// Async/await
async fn fetch_data(url: string) -> Result<string, Error> {
    let response = await http_get(url)
    Ok(response.body)
}
```

## Contributing

Contributions are welcome! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Setup

1. Clone the repository
2. Run `npm install`
3. Open in VS Code
4. Press `F5` to launch a new VS Code window with the extension loaded
5. Open any `.script` file to test

### Testing

```bash
npm test        # Run tests
npm run lint    # Check code style
```

## Roadmap

- [x] Basic syntax highlighting
- [x] Language configuration
- [x] File type recognition
- [ ] Language Server Protocol integration (85% complete)
- [ ] IntelliSense and auto-completion
- [ ] Debugging support
- [ ] REPL integration
- [ ] Code snippets
- [ ] Formatting support

## Auto-Updates

The extension automatically updates when new versions are published to the marketplace. You can:
- Control auto-updates in VS Code settings
- View update notifications with changelog links
- Manually check for updates in the Extensions view

See [AUTO_UPDATE.md](https://github.com/moikas-code/vscode-script-extension/blob/main/docs/AUTO_UPDATE.md) for more details.

## License

MIT - See [LICENSE](LICENSE) for details.

## Links

- [Script Language Repository](https://github.com/moikapy/script)
- [Script Documentation](https://github.com/moikapy/script/tree/main/docs)
- [Report Issues](https://github.com/moikas-code/vscode-script-extension/issues)
- [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=moikas-code.script-lang)