# Contributing to Script VS Code Extension

Thank you for your interest in contributing to the Script VS Code extension! This document provides guidelines and instructions for contributing.

## Getting Started

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/vscode-script.git
   cd vscode-script
   ```
3. Install dependencies:
   ```bash
   npm install
   ```

## Development Workflow

1. Create a new branch for your feature:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes

3. Test your changes:
   - Press `F5` in VS Code to launch Extension Development Host
   - Open `.script` files to test functionality
   - Run tests: `npm test`

4. Commit your changes:
   ```bash
   git add .
   git commit -m "feat: add your feature description"
   ```

5. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

6. Create a Pull Request

## Code Style

- Use 2 spaces for indentation in JSON files
- Use 4 spaces for indentation in TypeScript files (if added)
- Follow existing patterns in the codebase

## Adding Grammar Rules

The syntax highlighting is defined in `syntaxes/script.tmLanguage.json`. To add new patterns:

1. Identify the scope (e.g., `keyword.control.script`)
2. Add the pattern to the appropriate section
3. Test with various code samples

Example:
```json
{
  "name": "keyword.control.new-keyword.script",
  "match": "\\bnew_keyword\\b"
}
```

## Testing Syntax Highlighting

1. Create test files in a `test-files/` directory
2. Include various Script language constructs
3. Verify highlighting works correctly

## Commit Convention

We use conventional commits:

- `feat:` New features
- `fix:` Bug fixes
- `docs:` Documentation changes
- `style:` Code style changes
- `refactor:` Code refactoring
- `test:` Test additions/changes
- `chore:` Maintenance tasks

## Reporting Issues

- Use the issue template
- Include VS Code version
- Include extension version
- Provide minimal reproduction steps
- Include sample code if applicable

## Questions?

Feel free to open an issue for questions or join the discussion in the Script language community.