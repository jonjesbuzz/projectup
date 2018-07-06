import Foundation

public protocol FileElement {
    var filename: String { get }
    func create(at url: URL) throws
}

public struct File: FileElement {
    private(set) public var filename: String
    public var content: String

    init(_ filename: String, content: String = "", templateFile: String? = nil) {
        self.filename = filename
        if let template = templateFile {
            fatalError("Template not yet implemented");
        } else {
            self.content = content
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
}

public struct Directory: FileElement {
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
            for file in contents {
                try file.create(at: directoryURL)
            }
        } catch {
            throw ProjectUpError.fileWriteError(reason: "Could not create directory \(filename)", underlyingError: error)
        }
    }
}