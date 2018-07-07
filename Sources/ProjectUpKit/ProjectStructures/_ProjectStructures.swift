public struct ProjectStructures {
    public static var structures: [String: Project.Type] = [
        "swift":    SwiftProject.self,
        "c":        CProject.self,
        "none":     Project.self
    ]
}