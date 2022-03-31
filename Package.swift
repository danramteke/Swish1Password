// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "Swish 1Password Plugin",
  platforms: [
    .macOS(.v12),
  ],
  products: [
    .library(name: "Swish1Password", targets: ["Swish1Password"])
  ],
  dependencies: [
    .package(url: "https://github.com/danramteke/Swish.git", branch: "1.2.2"),
  ],
  targets: [
    .target(name: "Swish1Password", dependencies: [.product(name: "SwishKit", package: "Swish")])
  ]
)