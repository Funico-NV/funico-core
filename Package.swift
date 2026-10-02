// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "funico-core",
    platforms: [
        .iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9)
    ],
    products: [
        .library(name: "FunicoFoundation", targets: ["FunicoFoundation"]),
        .library(name: "FunicoKit", targets: ["FunicoKit"]),
        .library(name: "FunicoAPI", targets: ["FunicoAPI"]),
        .library(name: "FunicoERP", targets: ["FunicoERP"])
    ],
    traits: [
        // SwiftUI conveniences (accent colors). Enabled by default so apps keep them; servers
        // and other UI-free clients depend on this package with `traits: []`.
        .trait(name: "SwiftUIExtensions"),
        .default(enabledTraits: ["SwiftUIExtensions"])
    ],
    targets: [
        .target(
            name: "FunicoFoundation",
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "FunicoKit"
        ),
        .testTarget(
            name: "FunicoKitTests",
            dependencies: ["FunicoKit"]
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
