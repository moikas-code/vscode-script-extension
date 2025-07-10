import * as vscode from 'vscode';

export function activate(context: vscode.ExtensionContext) {
    console.log('Script Language extension is now active!');
    
    // Check for extension updates and notify user of new features
    const currentVersion = context.extension.packageJSON.version;
    const previousVersion = context.globalState.get<string>('scriptExtensionVersion');
    
    if (previousVersion !== currentVersion) {
        // New install or update
        if (!previousVersion) {
            // First install
            vscode.window.showInformationMessage(
                'Welcome to Script Language Support! Check out the documentation to get started.',
                'View Docs'
            ).then(selection => {
                if (selection === 'View Docs') {
                    vscode.env.openExternal(vscode.Uri.parse('https://github.com/moikapy/script'));
                }
            });
        } else {
            // Update
            vscode.window.showInformationMessage(
                `Script Language Support updated to v${currentVersion}. See what's new!`,
                'View Changelog'
            ).then(selection => {
                if (selection === 'View Changelog') {
                    vscode.env.openExternal(vscode.Uri.parse('https://github.com/script-lang/vscode-script/blob/main/CHANGELOG.md'));
                }
            });
        }
        
        // Store current version
        context.globalState.update('scriptExtensionVersion', currentVersion);
    }
    
    // Register a simple command as example
    const disposable = vscode.commands.registerCommand('script.helloWorld', () => {
        vscode.window.showInformationMessage('Hello from Script Language!');
    });
    
    context.subscriptions.push(disposable);
}

export function deactivate() {
    // Cleanup if needed
}