//
//  GetBalanace.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/10/21.
//

import Foundation

// MARK: - Response
public typealias GetBalanceResponse = RPCResponse<GetBalanceResult>

public struct GetBalanceResult: Codable {
    let context: GetBalanceContext
    let value: UInt64
}

public struct GetBalanceContext: Codable {
    let slot: UInt64
}
