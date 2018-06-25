// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "whereami",
    dependencies: [
        .package(url: "https://github.com/apple/swift-package-manager", .revision("4d0bab2")),
    ],
    targets: [
        .target(
            name: "whereami",
            dependencies: ["Utility"]),
    ]
)
