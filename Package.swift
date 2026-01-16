// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "funico-core",
    platforms: [
        .iOS(.v15), .macOS(.v12)
    ],
    products: [
        .library(
            name: "FunicoCore",
            targets: ["FunicoCore"]
        )
    ],
    targets: [
        .target(
            name: "FunicoCore",
        ),
        .testTarget(
            name: "FunicoCoreTests",
            dependencies: ["FunicoCore"]
        )
    ]
)
