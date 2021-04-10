//
//  GetBlockTime.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/10/21.
//

import Foundation

// MARK: - Response
public struct GetBlockTimeResponse: Codable {
    let id: Int
    let jsonrpc: String
    let result: Int?
    let error: RpcError?
}
