//
//  SimulateTransaction.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/14/21.
//

import Foundation

// MARK: - Request
public struct SimulateTransactionRequest: Codable {
    let transaction: String
    let config: SimulateTransactionConfig?
}

public struct SimulateTransactionConfig: Codable {
    let sigVerify: Bool
    let commitment: Commitment?
    let encoding: Encoding?
}

// MARK: - Response
public typealias SimulateTransactionResponse = RPCResponse<SimulateTransactionResult>

public struct SimulateTransactionResult: Codable {
    let context: SimulateTransactionContext
    let value: SimulateTransactionValue
}

public struct SimulateTransactionContext: Codable {
    let slot: Int
}

public struct SimulateTransactionValue: Codable {
    let err: TransactionError?
    let logs: [String]?
}
