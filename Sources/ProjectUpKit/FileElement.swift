import Foundation

public protocol FileElement: CustomStringConvertible {
    var filename: String { get }
    func create(at url: URL) throws
}

// This enables you to call `create(at:)` on a FileElement sequence type.
// Useful for scripting instead of creating a whole class structure.
extension Sequence where Element == FileElement {
    func create(at url: URL) throws {
        for file in self {
            try file.create(at: url)
        }
    }
}
