import Foundation

print(ProjectStructures.structures)

let test = Project(named: "Test")
print(test)
print("\n")
let swift = (ProjectStructures.structures["swift"]!).init(named: "SwiftTest")
print(swift)

try! swift.create()
