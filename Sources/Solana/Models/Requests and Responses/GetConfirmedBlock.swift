//
//  GetConfirmedBlock.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/10/21.
//

import Foundation

// MARK: - Response
public typealias GetConfirmedBlockResponse = RPCResponse<GetConfirmedBlockResult>

public struct GetConfirmedBlockResult: Codable {
    let blockTime: Int64?
    let blockhash: String
    let parentSlot: UInt64
    let previousBlockhash: String
    let rewards: [GetConfirmedBlockReward]
    let transactions: [GetConfirmedBlockTransactionElement]
}

public struct GetConfirmedBlockReward: Codable {
    let pubkey: String
    let lamports: Int64
    let postBalance: UInt64
    let rewardType: RewardType?
}

public struct GetConfirmedBlockTransactionElement: Codable {
    let meta: GetConfirmedBlockMeta?
    let transaction: Transaction
}

public struct GetConfirmedBlockMeta: Codable {
    let err: String? // ToDo
    let fee: UInt64
    let innerInstructions: [BlockInstruction]?
    let logMessages: [String]?
    let preBalances: [UInt64]?
    let postBalances: [UInt64]?
    let postTokenBalances: [String]
    let preTokenBalances: [String]
}

