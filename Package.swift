// swift-tools-version:4.1
import PackageDescription
/**
# TODO - integrate the following tools into the build process:
# 	jazzy (a documentation generator)
# 	Sourcery (a code generator, e.g. lomok for swift)
# 	
**/
let package = Package(
    name: "SwiftScientificLibrary" ,
    products: [
        .library(name: "SwiftScientificLibrary", targets: ["SwiftScientificLibrary"]),
    ],
    targets: [
        .target(name: "SwiftScientificLibrary"),
        .testTarget(
                name: "SwiftScientificLibraryTests",
                dependencies: ["SwiftScientificLibrary"])
    ]
)

