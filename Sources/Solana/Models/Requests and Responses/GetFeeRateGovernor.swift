//
// GeneCrucean.swift
//

import Foundation

// MARK: - Response
public typealias GetFeeRateGovernorResponse = RPCResponse<GetFeeRateGovernorResult>

public struct GetFeeRateGovernorResult: Codable {
    public let context: GetFeeRateGovernorContext
    public let value: GetFeeRateGovernorValue

    enum CodingKeys: String, CodingKey {
        case context = "context"
        case value = "value"
    }
}

public struct GetFeeRateGovernorContext: Codable {
    public let slot: Int

    enum CodingKeys: String, CodingKey {
        case slot = "slot"
    }
}

public struct GetFeeRateGovernorValue: Codable {
    public let feeRateGovernor: FeeRateGovernor

    enum CodingKeys: String, CodingKey {
        case feeRateGovernor = "feeRateGovernor"
    }
}

public struct FeeRateGovernor: Codable {
    public let burnPercent: Int
    public let maxLamportsPerSignature: Int
    public let minLamportsPerSignature: Int
    public let targetLamportsPerSignature: Int
    public let targetSignaturesPerSlot: Int

    enum CodingKeys: String, CodingKey {
        case burnPercent = "burnPercent"
        case maxLamportsPerSignature = "maxLamportsPerSignature"
        case minLamportsPerSignature = "minLamportsPerSignature"
        case targetLamportsPerSignature = "targetLamportsPerSignature"
        case targetSignaturesPerSlot = "targetSignaturesPerSlot"
    }
}
