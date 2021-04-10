//
//  GetConfirmedBlocks.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/11/21.
//

import Foundation

// MARK: - Response
public struct GetConfirmedBlocksResponse: Codable {
    let jsonrpc: String
    let result: [UInt64]
    let id: Int
    let error: RpcError?
}
