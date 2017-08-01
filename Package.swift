import PackageDescription


let package = Package(
    name: "SwiftScientificLibrary",
       dependencies: [
        .Package(url: "./CBlas", majorVersion: 1)
    ]

)

