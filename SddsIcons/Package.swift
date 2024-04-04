// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDDSIcons",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SDDSIcons",
            targets: ["SddsIcons"]),
    ],
    targets: [
        .binaryTarget(
            name: "SDDSIcons",
            url: "https://github.com/salute-developers/plasma-ios/releases/download/sdds-icons-v0.1.0/sdds-icons-0.1.0.zip",
            checksum: "25e90c3c17c44a4a4404c66a9d3f81599a30dce59db863e414cd04fa00655297"
        )
    ]
)
