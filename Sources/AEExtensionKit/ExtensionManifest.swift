//
//  ExtensionManifest.swift
//  
//
//  Created by Wesley de Groot on 18/10/2022.
//

import Foundation

public struct ExtensionManifest: Codable, Hashable {
    public var name: String
    public var displayName: String
    public var version: String
    public var minAEVersion: String
    public var homepage: URL?
    public var repository: URL?
    public var issues: URL?
}
