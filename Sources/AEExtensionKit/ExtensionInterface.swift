//
//  ExtensionInterface.swift
//  
//
//  Created by Wesley de Groot on 07/10/2022.
//

import Foundation

public typealias AuroraAPI = (String, [String: Any]) -> Void

/// A protocol for extensions to conform to
public protocol ExtensionInterface {
    @discardableResult
    /// Respond to an action
    /// - Parameters:
    ///   - action: action to respond to
    ///   - parameters: parameters
    /// - Returns: should continue
    func respond(action: String, parameters: [String: Any]) -> Bool

    /// Register your extension.
    ///
    /// - Note: if no value is provided your plugin will not load!
    /// - Returns: ExtensionManifest
    func register() -> ExtensionManifest
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
