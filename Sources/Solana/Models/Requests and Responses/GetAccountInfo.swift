//
//  GetAccountInfo.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/10/21.
//

import Foundation

// MARK: - Response
public typealias GetAccountInfoResponse = RPCResponse<GetAccountInfoResult>

public struct GetAccountInfoResult: Codable {
    let context: GetAccountInfoContext
    let value: GetAccountInfoValue?
}

public struct GetAccountInfoContext: Codable {
    let slot: Int
}

public struct GetAccountInfoValue: Codable {
    let data: [String]
    let executable: Bool
    let lamports: UInt64
    let owner: String
    let rentEpoch: UInt64
}
