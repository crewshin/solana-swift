//
//  GetBlockCommitment.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/10/21.
//

import Foundation

// MARK: - Response
public typealias GetBlockCommitmentResponse = RPCResponse<GetBlockCommitmentResult>

public struct GetBlockCommitmentResult: Codable {
    let commitment: [Int]?
    let totalStake: Double
}
