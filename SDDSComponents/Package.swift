// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SDDSComponents",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "SDDSComponents",
            targets: ["SDDSComponents"])
    ],
    dependencies: [
        .package(name: "SDDSThemeCore", path: "../DesignSystemBuilder/SDDSThemeCore"),
        .package(name: "InputMask", path: "../Vendor/InputMask"),
        .package(name: "SDDSApiInfo", path: "../SDDSApiInfo")
    ],
    targets: [
        .target(
            name: "SDDSComponents",
            dependencies: ["SDDSThemeCore", "InputMask", "SDDSApiInfo"],
            path: "Sources/SDDSComponents",
            exclude: ["SDDSComponents.h"],
            resources: [
                .process("../../Assets.xcassets")
            ]
        )
    ]
)
