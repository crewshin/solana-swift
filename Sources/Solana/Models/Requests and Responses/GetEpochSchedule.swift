//
//  GetEpochSchedule.swift
//  SolanaDemoApp
//
//  Created by Arturo Jamaica on 2021/05/15.
//

import Foundation

// MARK: - Response
public typealias GetEpochScheduleResponse = RPCResponse<GetEpochScheduleResult>

public struct GetEpochScheduleResult: Codable {
    public let firstNormalEpoch: Int
    public let firstNormalSlot: Int
    public let leaderScheduleSlotOffset: Int
    public let slotsPerEpoch: Int
    public let warmup: Bool

    enum CodingKeys: String, CodingKey {
        case firstNormalEpoch = "firstNormalEpoch"
        case firstNormalSlot = "firstNormalSlot"
        case leaderScheduleSlotOffset = "leaderScheduleSlotOffset"
        case slotsPerEpoch = "slotsPerEpoch"
        case warmup = "warmup"
    }
}
