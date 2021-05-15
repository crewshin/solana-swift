//
//  GetConfirmedTransaction.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/11/21.
//

import Foundation

// MARK: - Response
public typealias GetConfirmedTransactionResponse = RPCResponse<GetConfirmedTransactionResult>

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
