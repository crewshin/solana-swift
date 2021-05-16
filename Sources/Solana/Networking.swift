//
//  Networking.swift
//  Solana
//
//  Created by Gene Crucean on 3/10/21.
//

import Foundation

// MARK: - Networking
public struct Networking {
    
    var globalHeaders: [String: String] = {
        var headers = [String: String]()
        headers["Content-Type"] = "application/json"
        return headers
    }()
    
    public init() {}
    
    public struct Response<T> {
        public let value: T
        public let response: URLResponse
    }
    
    public func decodableTask<T: Decodable>(request: URLRequest, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<Response<T>, Error>) -> Void) {
        
        var tmpRequest = request
        
        globalHeaders.forEach { (key, value) in
            tmpRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared.dataTask(with: tmpRequest) { (data, response, error) in
            guard let data = data, error == nil, let response = response else {
                completion(.failure(SolanaAPIError.generic(message: "API Call guard failed.")))
                return
            }
            
            do {
                let objectOutput = try JSONDecoder().decode(T.self, from: data)
                completion(.success(Response(value: objectOutput, response: response)))
            } catch {
                completion(.failure(SolanaAPIError.generic(message: "There was an issue decoding the response.")))
            }

            
            
        }.resume()
    }
}
