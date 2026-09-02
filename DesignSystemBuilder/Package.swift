// swift-tools-version:5.9
import PackageDescription

// Единый CLI дизайн-системы: генерация тем + документационный бандл.
// Раньше это были два бинаря (DesignSystemBuilder на xcodebuild и
// Tools/SDDSDocsAggregator на SwiftPM); теперь один самодостаточный
// исполняемый файл `dsbuilder` без внешнего фреймворка рядом.
//
// Xcode-проект в этой же директории остаётся: из него собираются
// SDDSThemeCore.xcframework, SDDSTheme и SDDSDemo — SwiftPM XCFramework
// не умеет.
let package = Package(
    name: "DesignSystemBuilder",
    platforms: [.macOS(.v13)],
    products: [
        .executable(name: "dsbuilder", targets: ["DesignSystemBuilderCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.7.0"),
        .package(url: "https://github.com/stencilproject/Stencil.git", from: "0.15.1"),
        .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.1"),
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "600.0.0"),
        .package(path: "SDDSThemeUtilities"),
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", from: "9.1.0")
    ],
    targets: [
        // Токены рантайм-ядра, которые нужны генератору. Берём точечно: пакет
        // SDDSThemeCore целиком под macOS не собирается (UIKit), а генератору
        // нужны только value-типы токенов. В Xcode эти файлы точно так же
        // компилируются прямо в таргет билдера.
        .target(
            name: "ThemeCoreTokens",
            path: "SDDSThemeCore/Sources/SDDSThemeCore",
            sources: ["Tokens/TypographyToken.swift"]
        ),
        // Генерация тем: токены, вариации компонентов, info-артефакты.
        .target(
            name: "DesignSystemBuilderCore",
            dependencies: [
                .product(name: "Stencil", package: "Stencil"),
                .product(name: "PathKit", package: "PathKit"),
                .product(name: "SDDSThemeUtilities", package: "SDDSThemeUtilities"),
                "ThemeCoreTokens"
            ],
            path: "DesignSystemBuilderCore",
            exclude: ["DesignSystemBuilderCore.docc"],
            resources: [.process("Stencil")]
        ),
        // Документационный бандл: скан `// @DocSample`, рендер маркеров, layout.
        .target(
            name: "DocsAggregatorCore",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftParser", package: "swift-syntax")
            ],
            path: "DocsAggregatorCore"
        ),
        .executableTarget(
            name: "DesignSystemBuilderCLI",
            dependencies: [
                "DesignSystemBuilderCore",
                "DocsAggregatorCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            path: "DesignSystemBuilderCLI"
        ),
        .testTarget(
            name: "DesignSystemBuilderCoreTests",
            dependencies: [
                "DesignSystemBuilderCore",
                .product(name: "OHHTTPStubs", package: "OHHTTPStubs"),
                .product(name: "OHHTTPStubsSwift", package: "OHHTTPStubs")
            ],
            path: "DesignSystemBuilderCoreTests",
            resources: [.process("Files"), .copy("Fixtures")]
        ),
        .testTarget(
            name: "DocsAggregatorCoreTests",
            dependencies: ["DocsAggregatorCore"],
            path: "DocsAggregatorCoreTests"
        )
    ]
)
