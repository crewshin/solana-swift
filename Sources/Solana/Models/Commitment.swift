//
//  Commitment.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/12/21.
//

import Foundation

public enum Commitment: String, RawRepresentable, Codable {
    case processed
    case confirmed
    case finalized
}
