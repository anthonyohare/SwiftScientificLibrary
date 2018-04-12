import PackageDescription

let package = Package(
    name: "SwiftScientificLibraryExample",
    dependencies: [
        .Package(url: "../../SwiftScientificLibrary",
                 versions: Version(0,0,0)..<Version(2,0,0))
    ]
)
