public class SwiftProject: Project {
    public override var structure: [FileElement] {
        return [
            File("Package.swift", templateContent: packageContent, context: ["swiftVersion": swiftVersion, "projectName": projectName]),
            Directory("Sources", contents: [
                Directory(self.projectName, contents: [
                    File("main.swift", content: "print(\"Hello, world! \(self.projectName)\")")
                ])
            ]),
            Directory("Tests")
        ]
    }

    let swiftVersion = "4.2"

    let packageContent = """
    // swift-tools-version: {{ swiftVersion }}
    // The swift-tools-version declares the minimum version of Swift required to build this package.

    import PackageDescription

    let package = Package(
        name: \"{{ projectName }}\",
        dependencies: [
            // Dependencies declare other packages that this package depends on.
            // .package(url: /* package url */, from: \"1.0.0\"),
        ],
        targets: [
            // Targets are the basic building blocks of a package. A target can define a module or a test suite.
            // Targets can depend on other targets in this package, and on products in packages which this package depends on.
            .target(
                name: \"{{ projectName }}\",
                dependencies: []),
        ]
    )
    """
}