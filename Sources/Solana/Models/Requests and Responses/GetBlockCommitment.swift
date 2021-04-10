//
//  GetBlockCommitment.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/10/21.
//

import Foundation

// MARK: - Response
public struct GetBlockCommitmentResponse: Codable {
    let jsonrpc: String
    let result: GetBlockCommitmentResult
    let id: Int
    let error: RpcError?
}

public struct GetBlockCommitmentResult: Codable {
    let commitment: [Int]?
    let totalStake: Double
}
