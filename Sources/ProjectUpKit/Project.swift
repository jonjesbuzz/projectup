import Foundation

public class Project: CustomStringConvertible {

    public var structure: [FileElement] { return [] }
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
