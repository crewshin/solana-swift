//
//  GetEpochInfo.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/12/21.
//

import Foundation

// MARK: - Response
public typealias GetEpochInfoResponse = RPCResponse<GetEpochInfoResult>

public struct GetEpochInfoResult: Codable {
    let absoluteSlot: UInt64
    let blockHeight: UInt64
    let epoch: UInt64
    let slotIndex: UInt64
    let slotsInEpoch: UInt64
    let transactionCount: UInt64
}
