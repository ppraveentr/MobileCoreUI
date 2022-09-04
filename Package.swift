// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MobileCoreUI",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(name: "MobileCoreUI", targets: ["MobileCoreUI", "Theme"]),
    ],
    dependencies: [ ],
    targets: [
        .target(name: "MobileCoreUI", dependencies: ["Theme"]),
        .testTarget(name: "MobileCoreUITests", dependencies: ["MobileCoreUI"]),
        .target(name: "Theme"),
        .testTarget(name: "ThemeTests", dependencies: ["Theme"]),
    ]
)
