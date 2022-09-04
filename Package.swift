// swift-tools-version: 5.6
import PackageDescription

private let libraryName = "MeasureSize"

let package = Package(
    name: libraryName,
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: libraryName,
            targets: [libraryName]),
    ],
    targets: [
        .target(
            name: libraryName,
            dependencies: [])
    ]
)
