// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlgoDSBenchmarking",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AlgoDSBenchmarking",
            targets: ["AlgoDSBenchmarking"]),
        .executable(name: "sorting-algorithm-benchmark", targets: ["sorting-algorithm-benchmark"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-collections-benchmark", from: "0.0.1"),
        .package(url: "https://github.com/apple/swift-collections", from: "0.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AlgoDSBenchmarking",
            dependencies: []),
        .target(
            name: "sorting-algorithm-benchmark",
            dependencies: [
                "AlgoDSBenchmarking",
                .product(name: "CollectionsBenchmark", package: "swift-collections-benchmark")
            ]
        ),
        .testTarget(
            name: "AlgoDSBenchmarkingTests",
            dependencies: ["AlgoDSBenchmarking"]),
    ]
)
