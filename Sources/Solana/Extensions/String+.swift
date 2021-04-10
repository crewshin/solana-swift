//
//  String+.swift
//  NetworkStackExamples
//
//  Created by Gene Crucean on 1/9/21.
//

import Foundation

extension String {
    func toObject<T: Decodable>() throws -> T {
        let data = Data(self.utf8)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
