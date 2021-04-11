![Repo image](https://github.com/crewshin/solana-swift/blob/main/Resources/Logo.png)

# Solana-Swift

![Build & Test](https://github.com/crewshin/solana-swift/actions/workflows/build.yml/badge.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://github.com/crewshin/solana-swift/blob/main/LICENSE)
[![swift-version](https://img.shields.io/badge/swift-5.1-brightgreen.svg)](https://github.com/apple/swift)

Solana Swift SDK (Based off https://docs.solana.com/developing/clients/jsonrpc-api).

This is actively **WIP** at the moment. PR's welcome! [Development happening in the demo app repo](https://github.com/crewshin/solana-swift-demo-app)


## Getting Started

#### Swift Package Manager (Xcode 11 and above)
1. Select `File`/`Swift Packages`/`Add Package Dependency` from the menu.
2. Paste `https://github.com/crewshin/solana-swift.git`.

Why not CocoaPods, or Carthage?

Supporting multiple dependency managers makes maintaining a library exponentially more complicated and time consuming. Furthermore, with the integration of the Swift Package Manager in Xcode 11 and greater, I expect the need for alternative solutions to fade quickly.


## Usage

```swift
import Solana
```


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



## WIP Status

I'm basically going down the list of methods from the [JSON RPC](https://docs.solana.com/developing/clients/jsonrpc-api#methods)

Right now I've implemented the foundational stuff and am n this commit, I've done a first pass on:

```swift
getAccountInfo
getBalance
getBlockCommitment
getBlockTime
getClusterNodes
getConfirmedBlock
getConfirmedBlocks
getConfirmedBlocksWithLimit
getConfirmedSignaturesForAddress
getConfirmedSignaturesForAddress2
getConfirmedTransaction
getEpochInfo
```


Feel free to say hi on Discord: `crewshin#3286`

