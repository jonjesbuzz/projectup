import Foundation
import ProjectUpKit

print(ProjectStructures.structures)

let test = Project(named: "Test")
print(test)
print("\n")
let c = (ProjectStructures.structures["c"]!).init(named: "CTest")
print(c)

try! c.create()
