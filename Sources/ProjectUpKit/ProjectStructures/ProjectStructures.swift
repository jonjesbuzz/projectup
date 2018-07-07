public struct ProjectStructures {
    public static var structures: [String: Project.Type] = [
        "swift": SwiftProject.self,
        "none": Project.self
    ]
}