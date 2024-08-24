// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "LoadingView",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "LoadingView",
            targets: ["LoadingView"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LoadingView",
            dependencies: []),
    ]
)
