// swift-tools-version:5.9
import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "SDDSApiInfo",
    platforms: [.iOS(.v15), .macOS(.v10_15)],
    products: [.library(name: "SDDSApiInfo", targets: ["SDDSApiInfo"])],
    dependencies: [.package(url: "https://github.com/swiftlang/swift-syntax.git", from: "601.0.0")],
    targets: [
        .macro(
            name: "SDDSApiInfoMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(name: "SDDSApiInfo", dependencies: ["SDDSApiInfoMacros"])
    ]
)
