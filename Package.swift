// swift-tools-version:5.1
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
        .target(name: "KituraStripeKit", dependencies: ["NIOHTTPClient", "NIOFoundationCompat"]),
        .testTarget(name: "KituraStripeKitTests", dependencies: ["NIOHTTPClient", "KituraStripeKit"])
    ]
)
