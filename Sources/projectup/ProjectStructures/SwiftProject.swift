public class SwiftProject: Project {
    public override var structure: [FileElement] {
        return [
            File("Package.swift"),
            Directory("Sources", contents: [
                File("main.swift", content: "print(\"Hello, world!\")")
            ]),
            Directory("Tests")
        ]
    }
}