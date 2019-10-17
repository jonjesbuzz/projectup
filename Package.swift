// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProjectUp",
    products: [
        .library(name: "ProjectUpKit", targets: ["ProjectUpKit"]),
        .executable(name: "projectup", targets: ["projectup"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/kylef/Stencil.git", from: "0.13.0"),
        .package(url: "https://github.com/kylef/Commander.git", from: "0.9.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "ProjectUpKit",
            dependencies: ["Stencil"]
        ),
        .target(
            name: "projectup",
            dependencies: ["ProjectUpKit", "Commander"]),
    ]
)
