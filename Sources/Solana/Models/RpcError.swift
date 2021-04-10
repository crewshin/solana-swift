//
//  RpcError.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/14/21.
//

import Foundation

public struct RpcError: Codable {
    let code: Int
    let message: String
}
