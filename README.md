# Swish 1Password
SwishKit plugin of 1Password CLI. Requires version 2 of the 1Password CLI. Download it here: https://1password.com/downloads/command-line/

## Example


### Example usage

Fetch a key out of 1Password and upload it to Heroku secret config variables.

    let op = OP()
    let key = try op.get(item: "Server", vault: "MyProjectVault", section: "Signing Keys", field: "JWT Signing Key")
    try sh(.terminal, #"heroku config:set JWT_SIGNING_KEY="$JWT_SIGNING_KEY"#, enviroment: ["JWT_SIGNING_KEY": key])

### Example `Package.swift`

    // swift-tools-version:5.6

    import PackageDescription

    let package = Package(
        name: "Scripts",
        platforms: [.macOS(.v12)],
        dependencies: [
          .package(url: "https://github.com/danramteke/swish.git", from: "1.0.0"),
          .package(url: "https://github.com/danramteke/swish-1password.git", from: "0.1.1"),
        ],
        targets: [
            .executableTarget(
                name: "heroku-env",
                dependencies: [
                    .product(name: "SwishKit", package: "Swish"),
                    .product(name: "Swish1Password", package: "swish-1password"),
                    ]),
        ]
    )
