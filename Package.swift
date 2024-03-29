// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "KituraStripeKit",
    products: [
        .library(name: "KituraStripeKit", targets: ["KituraStripeKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git",                     from: "2.0.0"),
        .package(url: "https://github.com/swift-server/swift-nio-http-client.git",  .branch("master")),
    ],
    targets: [
        .target(name: "KituraStripeKit", dependencies: ["AsyncHTTPClient", "NIOFoundationCompat"], path: "Sources"),
        .testTarget(name: "KituraStripeKitTests", dependencies: ["AsyncHTTPClient", "KituraStripeKit"], path: "Tests")
    ]
)
