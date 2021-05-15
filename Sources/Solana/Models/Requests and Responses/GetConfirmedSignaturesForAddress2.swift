//
//  GetConfirmedSignaturesForAddress2.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/11/21.
//

import Foundation

public struct GetConfirmedSignaturesForAddress2Config: Codable {
    let limit: UInt64?
    let before: String?
    let until: String?
}

// MARK: - Response
public typealias GetConfirmedSignaturesForAddress2Response = RPCResponse<[GetConfirmedSignaturesForAddress2Result]>

public struct GetConfirmedSignaturesForAddress2Result: Codable {
    let blockTime: Int64?
    let err: TransactionError?
    let memo: String?
    let signature: String
    let slot: UInt64
}
