//
//  ProgramSubscribe.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/12/21.
//

import Foundation

//// MARK: - Request
//public struct ProgramSubscribeRequest: Codable {
//    let pubkey: String
//    let config: ProgramSubscribeConfig?
//}
//
//public struct ProgramSubscribeConfig: Codable {
//    let commitment: Commitment?
//    var encoding: String = "jsonParsed"
//    let filters: Filter?
//}
//
//// MARK: - Response
//public struct ProgramSubscribeResponse: Codable {
//    
//}
//



public struct TestRequest: Codable {
    let test: String
}

// MARK: - Response
public struct TestResponse: Codable {
    let jsonrpc: String
    let result: TestResult
    let id: Int
}

public struct TestResult: Codable {
    let parent: Int
    let root: Int
    let slot: Int
}
