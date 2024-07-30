// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "plasma-ios",
    platforms: [
        .iOS(.v14)
    ],
    products: [],
    dependencies: [
        .package(path: "./SDDSComponents"),
        .package(path: "./SDDSIcons"),
        .package(path: "./SDDSThemeBuilder/SDDSThemeCore")
    ],
    targets: []
)
