//
//  Instruction.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/14/21.
//

import Foundation

public struct CompiledInstruction: Codable {
    let programIDIndex: Int
    let accounts: [Int]
    let data: [UInt8]
}

// TODO: Unify "Instruction" across calls.
//public struct Instruction: Codable {
//    let programID: [UInt8]
//    let accounts: [AccountMeta]
//    let data: [UInt8]
//}

public struct Instruction: Codable {
    let accounts: [Int]
    let data: String
    let programIDIndex: Int

    enum CodingKeys: String, CodingKey {
        case accounts
        case data
        case programIDIndex = "programIdIndex"
    }
}
