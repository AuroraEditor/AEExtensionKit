//
//  ExtensionAPI.swift
//  
//
//  Created by Wesley de Groot on 07/10/2022.
//

import Foundation

/// A protocol to conform to for Extension API instance assigned to ``extensionId``
public protocol ExtensionAPI {

    var extensionId: String { get }
    var workspaceURL: URL { get }

    /// API to work with targets
    var targets: TargetsAPI { get }

}
