// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_10),
        .watchOS(.v2),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "Core",
            targets: [
                "Core"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/vpsyukalovzuzex/Api.git",
            .branch("main")
        ),
        .package(
            url: "https://github.com/realm/realm-cocoa.git",
            from: .init("10.14.0")
        )
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                .product(name: "Api"),
                .product(name: "RealmSwift")
            ]
        ),
        .testTarget(
            name: "CoreTests",
            dependencies: [
                "Core"
            ]
        )
    ]
)
