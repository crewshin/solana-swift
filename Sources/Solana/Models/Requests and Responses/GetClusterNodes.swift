//
//  GetClusterNodes.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/10/21.
//

import Foundation

// MARK: - Response
public struct GetClusterNodesResponse: Codable {
    let jsonrpc: String
    let result: [GetClusterNodesResult]
    let id: Int
    let error: RpcError?
}

public struct GetClusterNodesResult: Codable {
    let featureSet: UInt64?
    let gossip: String
    let pubkey: String
    let rpc: String?
    let tpu: String?
    let version: String?
}
