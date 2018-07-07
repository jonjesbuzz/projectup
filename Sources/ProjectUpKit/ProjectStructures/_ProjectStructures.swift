//
//  _ProjectStructures.swift
//  ProjectUpKit
//
//  Created by Jonathan Jemson on 7/6/18.
//  Copyright © 2018 Jonathan Jemson.
//

public struct ProjectStructures {
    public static var structures: [String: Project.Type] = [
        "swift":    SwiftProject.self,
        "c":        CProject.self,
        "none":     Project.self
    ]
}
