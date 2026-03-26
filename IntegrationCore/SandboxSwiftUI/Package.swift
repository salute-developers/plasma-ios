// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SandboxSwiftUI",
    platforms: [
        .iOS(.v15),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "SandboxSwiftUI",
            targets: ["SandboxSwiftUI"]
        )
    ],
    dependencies: [
        .package(path: "../SandboxCore")
    ],
    targets: [
        .target(
            name: "SandboxSwiftUI",
            dependencies: ["SandboxCore"],
            path: "Sources/SandboxSwiftUI"
        ),
        .testTarget(
            name: "SandboxSwiftUITests",
            dependencies: ["SandboxSwiftUI"],
            path: "Tests/SandboxSwiftUITests"
        )
    ]
)
