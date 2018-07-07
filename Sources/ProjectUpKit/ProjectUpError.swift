//
//  ProjectUpError.swift
//  ProjectUpKit
//
//  Created by Jonathan Jemson on 7/6/18.
//  Copyright © 2018 Jonathan Jemson. 
//

public enum ProjectUpError : Error {
    case urlError(failingURL: String)
    case fileWriteError(reason: String, underlyingError: Error)
    case templateRenderError(underlyingError: Error)
}
