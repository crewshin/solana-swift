//
//  TokenBalance.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/11/21.
//

import Foundation

public struct TokenBalance: Codable {
    let accountIndex: Int
    let mint: String
    let uiTokenAmount: UITokenAmount
}

public struct UITokenAmount: Codable {
    let amount: String
    let decimals: Int
    let uiAmount: Int?
    let uiAmountString: String
}
