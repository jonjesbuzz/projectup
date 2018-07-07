import Foundation
import ProjectUpKit
import Commander

let validopts = ProjectStructures.structures.keys.joined(separator: ", ")

command(
    Argument<String>("project-type", description: "The project generator you want to use. Required. Valid options are [\(validopts)]"),
    Argument<String>("name", description: "A name for the project. Required."),
    Option<String>("location", default: ".", description: "The location to create this project.")
) { name, projectType, location in
    if let strType = ProjectStructures.structures[projectType] {
        let project = strType.init(named: name)
        try! project.create(at: location)
    } else {
        print("ERROR: Project type \(projectType) is unknown to projectup.")
        exit(-1)
    }
}.run()
