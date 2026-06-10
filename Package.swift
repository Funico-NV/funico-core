// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "funico-core",
    platforms: [
        .iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9)
    ],
    products: [
        .library(name: "FunicoFoundation", targets: ["FunicoFoundation"]),
        .library(name: "FunicoAPI", targets: ["FunicoAPI"]),
        .library(name: "FunicoERP", targets: ["FunicoERP"])
    ],
    targets: [
        .target(
            name: "FunicoFoundation",
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "FunicoAPI",
            dependencies: ["FunicoFoundation", "FunicoERP"]
        ),
        .testTarget(
            name: "FunicoAPITests",
            dependencies: ["FunicoAPI"]
        ),
        .target(
            name: "FunicoERP",
            dependencies: ["FunicoFoundation"]
        ),
        .testTarget(
            name: "FunicoERPTests",
            dependencies: ["FunicoERP"]
        )
    ]
)
