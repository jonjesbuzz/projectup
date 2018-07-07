import Foundation

public protocol FileElement: CustomStringConvertible {
    var filename: String { get }
    func create(at url: URL) throws
}
