//
//  JSON+.swift
//  Avalbl
//
//  Created by Gene Crucean on 12/1/19.
//  Copyright © 2019 Avalbl. All rights reserved.
//

import Foundation

extension String {
    public func convertJsonStringToDict() -> [String: Any] {
        guard let stringData = self.data(using: .utf8) else { return [:] }

        do {
            guard let json = try JSONSerialization.jsonObject(with: stringData, options: []) as? [String: Any] else { return [:] }
            return json
        } catch {
            return [:]
        }
    }
}

extension Encodable {
    public var asDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

//extension Dictionary where Key == String, Value == String {
extension Dictionary {
    public func convertDictToJsonString() -> String {
        do {
            let stringData = try JSONSerialization.data(withJSONObject: self, options: [])
            return String(data: stringData, encoding: .utf8) ?? ""
        } catch {
            return ""
        }
    }
    
    public func convertDictToJsonData() -> Data {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: [])
        } catch {
            return Data()
        }
    }
}

extension Array {
    public func convertArrayToJsonString() -> String {
        do {
            let stringData = try JSONSerialization.data(withJSONObject: self, options: [])
            return String(data: stringData, encoding: .utf8) ?? ""
        } catch {
            return ""
        }
    }
    
    public func convertArrayToJsonData() -> Data {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: [])
        } catch {
            return Data()
        }
    }
}
