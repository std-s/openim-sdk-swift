// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenIMSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "OpenIMSDK",
            targets: ["OpenIMSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.28.2"),
    ],
    targets: [
        .target(
            name: "OpenIMSDK",
            dependencies: [
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                .target(name: "OpenIMSDKCore")
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy"),
            ]
        ),
        .binaryTarget(name: "OpenIMSDKCore", path: "Framework/OpenIMSDKCore.xcframework"),
        .testTarget(
            name: "OpenIMSDKTests",
            dependencies: ["OpenIMSDK"]
        ),
    ],
    swiftLanguageVersions: [
        .v5,
    ]
)

