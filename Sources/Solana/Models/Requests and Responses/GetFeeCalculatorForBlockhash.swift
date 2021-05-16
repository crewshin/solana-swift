//
// GeneCrucean.swift
//

import Foundation

// MARK: - Response
public typealias GetFeeCalculatorForBlockhashResponse = RPCResponse<GetFeeCalculatorForBlockhashResult>

public struct GetFeeCalculatorForBlockhashResult: Codable {
    public let context: GetFeeCalculatorForBlockhashContext
    public let value: GetFeeCalculatorForBlockhashValue?
}

public struct GetFeeCalculatorForBlockhashContext: Codable {
    public let slot: Int
}

public struct GetFeeCalculatorForBlockhashValue: Codable {
    public let feeCalculator: FeeCalculator
}

public struct FeeCalculator: Codable {
    public let lamportsPerSignature: Int
}
