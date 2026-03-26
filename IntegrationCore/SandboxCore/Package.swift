// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SandboxCore",
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SandboxCore",
            targets: ["SandboxCore"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SandboxCore",
            dependencies: [],
            path: "Sources/SandboxCore"
        ),
        .testTarget(
            name: "SandboxCoreTests",
            dependencies: ["SandboxCore"],
            path: "Tests/SandboxCoreTests"
        )
    ]
)
