public class CProject: Project {
    public override var structure: [FileElement] {
        return [
            File("Makefile"),
            Directory("src", contents: [
                File("\(self.projectName.lowercased()).c"),
                File("main.c")
            ]),
            Directory("include", contents: [
                File("\(self.projectName.lowercased()).h"),
            ])
        ]
    }
}