//
//  String+Validator.swift
//  ProjectUpKit
//
//  Created by Jonathan Jemson on 7/7/18.
//  Copyright © 2018 Jonathan Jemson. 
//

import Foundation

extension String {
    func isValidIdentifier() -> Bool {
        let identifier = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if let firstChar = identifier.first {
            let s = String(firstChar).trimmingCharacters(in: CharacterSet.decimalDigits)
            if s.isEmpty { return false }
        }
        if identifier.contains(" ") {
            return false
        }
        return !identifier.isEmpty
    }
}
