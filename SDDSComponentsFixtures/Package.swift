// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSComponentsFixtures",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "SDDSComponentsFixtures",
            targets: ["SDDSComponentsFixtures"])
    ],
    dependencies: [
        .package(path: "../SDDSComponents"),
        .package(path: "../Themes/SDDSservTheme")
    ],
    targets: [
        .target(
            name: "SDDSComponentsFixtures",
            dependencies: [
                "SDDSComponents",
                .product(name: "SDDSServTheme", package: "SDDSservTheme")
            ],
            path: "Sources/SDDSComponentsFixtures"
        )
    ]
)
