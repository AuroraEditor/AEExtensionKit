//
//  ExtensionInterface.swift
//  
//
//  Created by Wesley de Groot on 07/10/2022.
//

import Foundation

public enum AEHook {
    case save, load
}

public struct TextLocation {
    var pos: String
}

/// A protocol for extensions to conform to
public protocol ExtensionInterface {
    // MARK: Editor (read)

    /// did open file
    /// - Parameters:
    ///   - file: file path
    ///   - contents: file contents
    func didOpen(file: String, contents: Data)

    /// did open file in workspace
    /// - Parameters:
    ///   - workspace: workspace name
    ///   - file: file path
    ///   - contents: file contents
    func didOpen(workspace: String, file: String, contents: Data)

    /// did close file
    /// - Parameter file: file path
    func didClose(file: String)

    /// did save file
    /// - Parameter file: file path
    func didSave(file: String)

    /// did move caret to
    /// - Parameters:
    ///   - row: row
    ///   - column: column
    func didMoveCaret(row: Int, column: Int)

    /// activated file tab
    /// - Parameter file: file path
    func activated(file: String)

    /// deactivated file tab
    /// - Parameter file: file path
    func deactivated(file: String)
    func didInsert(text: String, position: TextLocation)
    func didReplace(text: String, with: String, position: TextLocation)
    func didRemove(text: String, position: TextLocation)

    // MARK: Editor (interaction)*
    func openFile(file: String)
    func closeFile(file: String)
    func moveCaret(to row: Int, column: Int)
    func willClose(file: String, closure: () -> Bool)
    func willSave(file: String, closure: () -> Bool)

    // MARK: User Interface (read)
    func navigator(opened: Bool)
    func inspector(opened: Bool)
    func showInformation(message: String)
    func showWarning(message: String)
    func showError(message: String)

    // MARK: User Interface (interaction)
    func openSettings()
    func openExtensionSettings()
//    func openModal(contents: ModelContents)
//    func closeModel(instance: ModelInstance)

    // MARK: Commands/Hooks
    func register(command: String, closure: () -> Void)
    func deregister(command: String)
    func register(hook: AEHook, closure: () -> Void)
    func deregister(hook: AEHook)

    // MARK: Webview
    func createWebviewPanel(contents: String)
}

public extension ExtensionInterface {
    // MARK: Editor (read)
    func didOpen(workspace: String, file: String, contents: Data) {}
    func didOpen(file: String, contents: Data) {}
    func didClose(file: String) {}
    func didSave(file: String) {}
    func didMoveCaret(row: Int, column: Int) {}
    func activated(file: String) {}
    func deactivated(file: String) {}
    func didInsert(text: String, position: TextLocation) {}
    func didReplace(text: String, with: String, position: TextLocation) {}
    func didRemove(text: String, position: TextLocation) {}

    // MARK: Editor (interaction)*
    func openFile(file: String) {}
    func closeFile(file: String) {}
    func moveCaret(to row: Int, column: Int) {}
    func willClose(file: String, closure: () -> Bool) {}
    func willSave(file: String, closure: () -> Bool) {}

    // MARK: User Interface (read)
    func navigator(opened: Bool) {}
    func inspector(opened: Bool) {}
    func showInformation(message: String) {}
    func showWarning(message: String) {}
    func showError(message: String) {}

    // MARK: User Interface (interaction)
    func openSettings() {}
    func openExtensionSettings() {}
//    func openModal(contents: ModelContents) {}
//    func closeModel(instance: ModelInstance) {}

    // MARK: Commands/Hooks
    func register(command: String, closure: () -> Void) {}
    func deregister(command: String) {}
    func register(hook: AEHook, closure: () -> Void) {}
    func deregister(hook: AEHook) {}

    // MARK: Webview
    func createWebviewPanel(contents: String) {}
}

open class ExtensionBuilder: NSObject {
    required public override init() {
        super.init()
    }

    /// Builds extension with API
    /// - Parameter withAPI: the API implementation itself
    open func build(withAPI api: ExtensionAPI) -> ExtensionInterface {
        fatalError("You should override ExtensionBuilder.build")
    }
}
