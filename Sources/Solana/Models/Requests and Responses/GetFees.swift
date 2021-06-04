//
// GeneCrucean.swift
//

import Foundation

// MARK: - Response
public typealias GetFeesResponse = RPCResponse<GetFeesResult>

public struct GetFeesResult: Codable {
    public let context: GetFeesContext
    public let value: GetFeesValue
}

// MARK: - Context
public struct GetFeesContext: Codable {
    public let slot: Int
}

// MARK: - Value
public struct GetFeesValue: Codable {
    public let blockhash: String
    public let feeCalculator: FeeCalculator
    public let lastValidSlot: Int
    public let lastValidBlockHeight: Int
}
