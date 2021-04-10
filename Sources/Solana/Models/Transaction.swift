//
//  Transaction.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/11/21.
//

import Foundation

// MARK: - Transaction
public struct Transaction: Codable {
    let signatures: [String]
    let message: Message
}

// MARK: - Message
public struct Message: Codable {
    let accountKeys: [String]
    let header: Header
    let instructions: [BlockInstruction]
    let recentBlockhash: String
}

// MARK: - Header
public struct Header: Codable {
    let numReadonlySignedAccounts: Int
    let numReadonlyUnsignedAccounts: Int
    let numRequiredSignatures: Int
}

// MARK: - Instruction
public struct BlockInstruction: Codable {
    let accounts: [Int]
    let data: String
    let programIDIndex: Int

    enum CodingKeys: String, CodingKey {
        case accounts
        case data
        case programIDIndex = "programIdIndex"
    }
}
