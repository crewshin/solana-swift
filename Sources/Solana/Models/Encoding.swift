//
//  Encoding.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/14/21.
//

import Foundation

public enum Encoding: String, RawRepresentable, Codable {
    case base58
    case base64
    case json
    case jsonParsed
    case base64Zstd = "base64+zstd"
}

