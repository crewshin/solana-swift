//
//  Filter.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/12/21.
//

import Foundation

public struct Filter: Codable {
    let memcmp: Memcmp
    let dataSize: UInt64
}

public struct Memcmp: Codable {
    let offset: Int
    let bytes: String
}
