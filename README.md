# Solana-Swift

Solana Swift SDK (Based off https://docs.solana.com/developing/clients/jsonrpc-api).

This is actively **WIP** at the moment. PR's welcome! [Development happening in the demo app repo](https://github.com/crewshin/solana-swift-demo-app)


## Getting Started

#### Swift Package Manager (Xcode 11 and above)
1. Select `File`/`Swift Packages`/`Add Package Dependency` from the menu.
2. Paste `https://github.com/crewshin/solana-swift.git`.

Why not CocoaPods, or Carthage?

Supporting multiple dependency managers makes maintaining a library exponentially more complicated and time consuming. Furthermore, with the integration of the Swift Package Manager in Xcode 11 and greater, I expect the need for alternative solutions to fade quickly.


## Usage

`import Solana`

Create an instance of Solana:

```swift
let solana = Solana(network: .main)
```

or 

```swift
let solana = SolanaSockets(network: .main)
```

Then:

```swift
solana.getAccountInfo(pubkey: pubkey) { (result) in
    switch result {
    case .failure(let error):
        if case let SolanaAPIError.getAccountInfoError(message) = error {
            print(message)
        }
    case .success(let response):
        if let value = response.value {
            print(value)
        }
    }
}

```