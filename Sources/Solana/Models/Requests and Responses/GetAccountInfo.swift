//
//  GetAccountInfo.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/10/21.
//

import Foundation

// MARK: - Response
public struct GetAccountInfoResponse: Codable {
    let jsonrpc: String
    let result: GetAccountInfoResult
    let id: Int
    let error: RpcError?
}

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
