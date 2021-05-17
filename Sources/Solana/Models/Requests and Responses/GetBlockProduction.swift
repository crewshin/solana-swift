//
// GeneCrucean.swift
//

import Foundation

// MARK: - Response
public typealias GetBlockProductionResponse = RPCResponse<GetBlockProductionResult>

public struct GetBlockProductionResult: Codable {
    public let context: GetBlockProductionContext
    public let value: GetBlockProductionValue
}

public struct GetBlockProductionContext: Codable {
    public let slot: Int
}

public struct GetBlockProductionValue: Codable {
    public let byIdentity: [String: [Int]]
    public let range: SlotRange
}
