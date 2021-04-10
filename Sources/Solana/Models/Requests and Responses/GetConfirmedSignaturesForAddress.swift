//
//  GetConfirmedSignaturesForAddress.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/11/21.
//

import Foundation

// MARK: - Response
public struct GetConfirmedSignaturesForAddressResponse: Codable {
    let jsonrpc: String
    let result: [String]
    let id: Int
    let error: RpcError?
}
