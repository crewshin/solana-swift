//
//  GetBalanace.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/10/21.
//

import Foundation

// MARK: - Response
public struct GetBalanceResponse: Codable {
    let jsonrpc: String
    let result: GetBalanceResult
    let id: Int
    let error: RpcError?
}

public struct GetBalanceResult: Codable {
    let context: GetBalanceContext
    let value: UInt64
}

public struct GetBalanceContext: Codable {
    let slot: UInt64
}
