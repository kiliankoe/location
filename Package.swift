// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "location",
    dependencies: [
        .package(url: "https://github.com/apple/swift-package-manager", .branch("master")),
    ],
    targets: [
        .target(
            name: "location",
            dependencies: ["Utility"]),
    ]
)
