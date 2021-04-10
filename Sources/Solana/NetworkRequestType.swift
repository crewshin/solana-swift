//
//  NetworkRequestType.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/14/21.
//

import Foundation

enum HTTPRequestType: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case head = "HEAD"
    case connect = "CONNECT"
    case options = "OPTIONS"
    case trace = "TRACE"
    case patch = "PATCH"
}
