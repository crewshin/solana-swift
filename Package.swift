// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Solana",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
//        .tvOS(.v13),
//        .watchOS(.v6),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Solana",
            targets: ["Solana"]),
    ],
    dependencies: [
        .package(url: "https://github.com/keefertaylor/Base58Swift", .upToNextMajor(from: "2.1.14")),
        .package(url: "https://github.com/pebble8888/ed25519swift", .upToNextMajor(from: "1.2.5")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Solana",
            dependencies: [
                "Base58Swift",
                "ed25519swift"
            ]),
        .testTarget(
            name: "SolanaTests",
            dependencies: ["Solana"]),
    ],
    swiftLanguageVersions: [.v5]
)
