// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of
// Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwiftChain",
  platforms: [
    .iOS(.v15),
    .macOS(.v13)
  ],
  products: [
    .library(
      name: "SwiftChain",
      targets: ["SwiftChain"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "SwiftChain",
      dependencies: []
    ),
    .testTarget(
      name: "SwiftChainTests",
      dependencies: ["SwiftChain"]
    ),
  ]
)
