//
//  GetConfirmedTransaction.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/11/21.
//

import Foundation

// MARK: - Response
public struct GetConfirmedTransactionResponse: Codable {
    let jsonrpc: String
    let result: GetConfirmedTransactionResult?
    let id: Int
    let error: RpcError?
}

public struct GetConfirmedTransactionResult: Codable {
    let slot: UInt64
    let transaction: Transaction
    let blockTime: Int64?
    let meta: GetConfirmedTransactionMeta?
}

public struct GetConfirmedTransactionMeta: Codable {
    let err: TransactionError?
    let fee: UInt64
    let preBalances: [UInt64]
    let postBalances: [UInt64]
    let innerInstructions: [BlockInstruction]?
    let preTokenBalances: [UInt64]?
    let postTokenBalances: [UInt64]?
    let logMessages: [String]?
}
