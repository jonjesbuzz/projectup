# ProjectUp

A quick and easy way to define directory and file layouts, programmatically.

## Getting Started
ProjectUp is divided into a framework (ProjectUpKit) and a command-line tool (projectup).

To use the projectup CLI tool, see the help instructions.

```
$ projectup --help

Usage:

    $ .build/debug/projectup <project-type> <name>

Arguments:

    project-type - The project generator you want to use. Required.
    name - A name for the project. Required.

Options:
    --location [default: .] - The location to create this project.
```

## Framework
The ProjectUpKit framework allows you to define your own project structures. Subclass `Project` and override the `structure` array with an array of `FileElement` objects (i.e, `Directory` and `File`). Then call, `create()` on the project class.

```swift
class SampleProject: Project {
    public override var structure: [FileElement] {
        return [
            File("FileSample"),
            Directory("DirSample", contents: [
                File("sample.manifest", content: "Sample Manifest File")
            ])
        ]
    }
}

try! SampleProject(named: "MySampleProject").create()
```

### File Templating
The `File` class supports templates through [Stencil](https://github.com/stencilproject/Stencil).

### Contributing Project classes
Feel free to contribute new project classes. Each built-in structure must include an entry in the `Sources/ProjectUpKit/ProjectStructures/_ProjectStructures.swift` file.
