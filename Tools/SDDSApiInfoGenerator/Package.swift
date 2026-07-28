// swift-tools-version:5.9
import PackageDescription

// Автономный build-tool: сканирует `*Appearance`-структуры SDDSComponents через SwiftSyntax
// и эмитит `ios-api-meta.json` — iOS-аналог Android `uikit-api-meta.json`
// (агрегатор API стилей). Держится отдельно от CLI SDDSThemeBuilder (тот собирается
// через xcodebuild и не тянет SPM-swift-syntax).
let package = Package(
    name: "SDDSApiInfoGenerator",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "600.0.0")
    ],
    targets: [
        .executableTarget(
            name: "SDDSApiInfoGenerator",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftParser", package: "swift-syntax")
            ]
        )
    ]
)
