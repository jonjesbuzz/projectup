//
//  Directory.swift
//  ProjectUpKit
//
//  Created by Jonathan Jemson on 7/6/18.
//  Copyright © 2018 Jonathan Jemson. 
//

import Foundation

public struct Directory: FileElement, CustomStringConvertible {
    private(set) public var filename: String
    private(set) public var contents: [FileElement]

    public init(_ name: String, contents: [FileElement] = []) {
        self.filename = name
        self.contents = contents
    }

    public func create(at url: URL) throws {
        let directoryURL = url.appendingPathComponent(filename)
        let fileManager = FileManager.default
        do {
            print("Creating directory \(filename)")
            try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: false)
            try contents.create(at: directoryURL)
        } catch {
            throw ProjectUpError.fileWriteError(reason: "Could not create directory \(filename)", underlyingError: error)
        }
    }

    public var description: String {
        return "Directory: \(filename) with contents: \(contents)"
    }
}
