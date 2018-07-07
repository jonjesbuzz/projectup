//
//  Project.swift
//  ProjectUpKit
//
//  Created by Jonathan Jemson on 7/6/18.
//  Copyright © 2018 Jonathan Jemson. 
//

import Foundation

open class Project: CustomStringConvertible {

    open var structure: [FileElement] { return [] }
    private(set) public var projectName: String

    public required init(named projectName: String, location: String = ".") {
        self.projectName = projectName
    }

    public var description: String {
        return "Project: \(projectName)\nType: \(type(of: self))\nStructure: \(structure)"
    }

    public func create(at location: String = ".") throws {
        let rootURL = URL(fileURLWithPath: (location as NSString).expandingTildeInPath)
        let rootDirectory = Directory(projectName, contents: structure)
        do {
            try rootDirectory.create(at: rootURL)
        } catch {
            print("Error: \(error)")
        }
    }
}
