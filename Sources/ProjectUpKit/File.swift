import Foundation
import Stencil

public struct File: FileElement, CustomStringConvertible {
    private(set) public var filename: String
    public var content: String

    public init(_ filename: String, content: String = "") {
        self.filename = filename
        self.content = content
    }

    public init(_ filename: String, templateContent: String = "", context: [String: String] = [:]) {
        self.filename = filename
        let template = Template(templateString: templateContent)
        do {
            self.content = try template.render(context)
        } catch {
            print("Templating Error: \(error)")
            self.content = ""
        }
    }

    public func create(at url: URL) throws {
        do {
            print("Creating file \(filename)")
            try self.content.write(to: url.appendingPathComponent(filename), atomically: true, encoding: .utf8)
        } catch {
            throw ProjectUpError.fileWriteError(reason: "Could not write contents to file", underlyingError: error)
        }
    }

    public var description: String {
        return "File: \(filename)"
    }
}