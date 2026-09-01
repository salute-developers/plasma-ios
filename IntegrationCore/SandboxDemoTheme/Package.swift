// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SandboxDemoTheme",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_15),
    ],
    products: [
        .library(name: "SandboxDemoTheme", targets: ["SandboxDemoTheme"]),
    ],
    dependencies: [
        .package(path: "../SandboxCore"),
        .package(path: "../../SDDSComponents"),
        .package(path: "../../DesignSystemBuilder/SDDSThemeCore"),
        .package(path: "../../Themes/SDDSservTheme"),
        .package(path: "../../Themes/PlasmaB2CTheme"),
        .package(path: "../../Themes/PlasmaHomeDSTheme"),
    ],
    targets: [
        .target(
            name: "SandboxDemoTheme",
            dependencies: [
                "SandboxCore",
                .product(name: "SDDSComponents", package: "SDDSComponents"),
                .product(name: "SDDSThemeCore", package: "SDDSThemeCore"),
                .product(name: "SDDSServTheme", package: "SDDSServTheme"),
                .product(name: "PlasmaB2CTheme", package: "PlasmaB2CTheme"),
                .product(name: "PlasmaHomeDSTheme", package: "PlasmaHomeDSTheme"),
            ],
            path: "Sources/SandboxDemoTheme"
        ),
    ]
)
