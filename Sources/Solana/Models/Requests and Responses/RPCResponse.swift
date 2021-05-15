//
//  RPCResponse.swift
//  SolanaDemoApp
//
//  Created by Arturo Jamaica on 2021/05/15.
//

import Foundation

public struct RPCResponse<T: Codable>: Codable {
    let jsonrpc: String
    let result: T
    let id: Int
    let error: RpcError?
}
