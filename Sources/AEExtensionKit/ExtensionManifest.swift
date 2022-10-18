//
//  ExtensionManifest.swift
//  
//
//  Created by Wesley de Groot on 18/10/2022.
//

import Foundation

public struct ExtensionManifest {
    public var name: String
    public var displayName: String
    public var version: String
    public var minAEVersion: String
    public var homepage: URL?
    public var repository: URL?
    public var issues: URL?

    public init(name: String,
                displayName: String,
                version: String,
                minAEVersion: String,
                homepage: URL? = nil,
                repository: URL? = nil,
                issues: URL? = nil) {
        self.name = name
        self.displayName = displayName
        self.version = version
        self.minAEVersion = minAEVersion
        self.homepage = homepage
        self.repository = repository
        self.issues = issues
    }
}
