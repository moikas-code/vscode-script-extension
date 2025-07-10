# Change Log

All notable changes to the Script Language VS Code extension will be documented in this file.

## [0.1.0] - 2025-01-10

### Added
- Initial release
- Syntax highlighting for Script language
- Language configuration (brackets, comments, indentation)
- File type recognition for `.script` files
- Custom language ID: `script`
- Basic TextMate grammar with support for:
  - Keywords (fn, let, const, if, else, while, etc.)
  - Types (i32, f32, bool, string, Array, Vec, etc.)
  - Functions and function calls
  - String literals with escape sequences
  - Numeric literals (integers, floats, hex, binary, octal)
  - Comments (line and block)
  - Operators

### Coming Soon
- Language Server Protocol integration
- IntelliSense and auto-completion
- Debugging support
- REPL integration