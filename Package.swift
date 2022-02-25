// swift-tools-version:5.5
import PackageDescription


let package = Package(
    name: "SwiftRMQ",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "SwiftRMQ",
            targets: ["SwiftRMQ"]
        )
    ],
    targets: [
        .target(
            name: "SwiftRMQ",
            dependencies: [
                .target(name: "Campq"),
                .target(name: "Cwrapper")
            ]
        ),
        .systemLibrary(
            name: "Campq",
            pkgConfig: "librabbitmq",
            providers: [
                 .brew(["rabbitmq-c"]),
                 .apt(["rabbitmq-c"])
            ]
        ),
        .target(
            name: "Cwrapper",
            dependencies: [
                .target(name: "Campq")
            ]
        )
    ]
)
