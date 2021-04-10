//
//  Network.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/14/21.
//

import Foundation

// MARK: - Network
public enum Network: String, RawRepresentable {
    case local = "http://localhost"
    case dev = "https://devnet.solana.com"
    case test = "https://testnet.solana.com"
    case main = "https://api.mainnet-beta.solana.com"
}
