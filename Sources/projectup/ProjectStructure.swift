import Foundation

public class Project: CustomStringConvertible {

    public var structure: [FileElement] { return [] }
    private(set) public var projectName: String
    private(set) public var rootURL: URL

    public required init(named projectName: String, location: String = ".") {
        self.projectName = projectName
        self.rootURL = URL(fileURLWithPath: location)
    }

    public var description: String {
        return "Project: \(projectName)\nLocation: \(self.rootURL)\nType: \(type(of: self))\nStructure: \(structure)"
    }

    public func create() throws {
        let rootDirectory = Directory(projectName, contents: structure)
        do {
            try rootDirectory.create(at: rootURL)
        } catch {
            print("Error: \(error)")
        }
    }
}