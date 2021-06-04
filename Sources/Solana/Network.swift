//
//  Network.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/14/21.
//

import Foundation

// MARK: - Network
public enum Network {
    case local(network: String)
    case dev
    case test
    case main
    
    var url: URL? {
        switch self {
        case .local(let network):
            return URL(string: network)
        case .dev:
            return URL(string: "https://devnet.solana.com")
        case .test:
            return URL(string: "https://testnet.solana.com")
        case .main:
            return URL(string: "https://api.mainnet-beta.solana.com")
        }
    }
}
