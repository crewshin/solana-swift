//
//  RewardType.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 4/8/21.
//

import Foundation

enum RewardType: String, Codable {
    case Fee
    case Rent
    case Voting
    case Staking
    
    // Ugh. Wanted lowercase cases but this coding keys wasn't working. Will look into later.
//    enum CodingKeys: String, CodingKey {
//        case fee = "Fee"
//        case rent = "Rent"
//        case voting = "Voting"
//        case staking = "Staking"
//    }
}
