//
//  Solana.swift
//  Solana
//
//  Created by Gene Crucean on 3/10/21.
//

import Foundation

public protocol SolanaDelegate {
    func receivedMessage<T: Codable>(message: T)
    func disconnected()
}

extension SolanaDelegate {
    func disconnected() {}
}

public class Solana {
    private let networking: Networking
    private var networkURL: URL
    private let jsonrpc = "2.0"
    
    public var delegate: SolanaDelegate?
    
    public init(network: Network, networking: Networking = Networking()) {
        self.networkURL = URL(string: network.rawValue)!
        self.networking = networking
    }
    
    // MARK: - Calls
    
    /// Returns all information associated with the account of provided Pubkey
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getaccountinfo
    ///
    /// - parameter request: GetAccountInfoRequest.
    /// - Returns: Returns an blahhh blahh TODO.
    public func getAccountInfo(pubkey: String, completion: @escaping (Result<Networking.Response<GetAccountInfoResponse>, SolanaAPIError>) -> Void) {
        
        // Simple sanity checking.
        guard pubkey.count > 0 else {
            completion(.failure(.getAccountInfoError(message: "Please enter a valid pubkey")))
            return
        }
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getAccountInfo",
            "params": [
                pubkey,
                ["encoding": Encoding.base58.rawValue]
            ]
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetAccountInfoResponse>, Error>) in
            switch result {
            case .failure(let error):
                // Log `people` related network errors here if needed.
                completion(.failure(.getAccountInfoError(message: error.localizedDescription)))
            case .success(let res):
                completion(.success(res))
            }
        }
    }

    public func getBalance(pubkeys: [String], completion: @escaping (Result<Networking.Response<GetBalanceResponse>, SolanaAPIError>) -> Void) {
        
        // Simple sanity checking.
        guard let data = pubkeys.first, data.count > 0 else {
            completion(.failure(.getBalanceError(message: "Please enter a valid pubkey(s). Comma separated.")))
            return
        }
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getBalance",
            "params": pubkeys
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetBalanceResponse>, Error>) in
            switch result {
            case .failure(let error):
                // Log `people` related network errors here if needed.
                completion(.failure(.getBalanceError(message: error.localizedDescription)))
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    public func getBlockCommitment(blocks: [UInt64], completion: @escaping (Result<Networking.Response<GetBlockCommitmentResponse>, SolanaAPIError>) -> Void) {
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getBlockCommitment",
            "params": blocks
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetBlockCommitmentResponse>, Error>) in
            switch result {
            case .failure(let error):
                // Log `people` related network errors here if needed.
                completion(.failure(.getBlockCommitmentError(message: error.localizedDescription)))
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    public func getBlockTime(blocks: [UInt64], completion: @escaping (Result<Networking.Response<GetBlockTimeResponse>, SolanaAPIError>) -> Void) {
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getBlockTime",
            "params": blocks
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetBlockTimeResponse>, Error>) in
            switch result {
            case .failure(let error):
                // Log `people` related network errors here if needed.
                completion(.failure(.getBlockTimeError(message: error.localizedDescription)))
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    public func getClusterNodes(completion: @escaping (Result<Networking.Response<GetClusterNodesResponse>, SolanaAPIError>) -> Void) {
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getClusterNodes"
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetClusterNodesResponse>, Error>) in
            switch result {
            case .failure(let error):
                // Log `people` related network errors here if needed.
                completion(.failure(.getClusterNodesError(message: error.localizedDescription)))
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    /// Only json is supported at this time.
    public func getConfirmedBlock(slot: UInt64, encoding: Encoding = .json, completion: @escaping (Result<Networking.Response<GetConfirmedBlockResponse>, SolanaAPIError>) -> Void) {
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getConfirmedBlock",
            "params": [
                slot,
                encoding.rawValue
            ]
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetConfirmedBlockResponse>, Error>) in
            switch result {
            case .failure(let error):
                // Log `people` related network errors here if needed.
                completion(.failure(.getConfirmedBlockError(message: error.localizedDescription)))
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    public func getConfirmedBlocks(startSlot: UInt64, endSlot: UInt64? = nil, completion: @escaping (Result<Networking.Response<GetConfirmedBlocksResponse>, SolanaAPIError>) -> Void) {
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getConfirmedBlocks",
            "params": [
                startSlot,
                endSlot
            ]
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetConfirmedBlocksResponse>, Error>) in
            switch result {
            case .failure(let error):
                // Log `people` related network errors here if needed.
                completion(.failure(.getConfirmedBlocksError(message: error.localizedDescription)))
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    public func getConfirmedBlocksWithLimit(startSlot: UInt64, limit: UInt64, completion: @escaping (Result<Networking.Response<GetConfirmedBlocksWithLimitResponse>, SolanaAPIError>) -> Void) {
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getConfirmedBlocksWithLimit",
            "params": [
                startSlot,
                limit
            ]
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetConfirmedBlocksWithLimitResponse>, Error>) in
            switch result {
            case .failure(let error):
                // Log `people` related network errors here if needed.
                completion(.failure(.getConfirmedBlocksWithLimitError(message: error.localizedDescription)))
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    public func getConfirmedSignaturesForAddress(address: String, startSlot: UInt64, endSlot: UInt64, completion: @escaping (Result<Networking.Response<GetConfirmedSignaturesForAddressResponse>, SolanaAPIError>) -> Void) {
        
        // Simple sanity checking.
        guard address.count > 0 else {
            completion(.failure(.getConfirmedSignaturesForAddressError(message: "Please enter a valid pubkey")))
            return
        }
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getConfirmedSignaturesForAddress",
            "params": [
                address,
                startSlot,
                endSlot
            ]
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetConfirmedSignaturesForAddressResponse>, Error>) in
            switch result {
            case .failure(let error):
                // Log `people` related network errors here if needed.
                completion(.failure(.getConfirmedSignaturesForAddressError(message: error.localizedDescription)))
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    public func getConfirmedSignaturesForAddress2(address: String, config: GetConfirmedSignaturesForAddress2Config? = nil, completion: @escaping (Result<Networking.Response<GetConfirmedSignaturesForAddress2Response>, SolanaAPIError>) -> Void) {
        
        // Simple sanity checking.
        guard address.count > 0 else {
            completion(.failure(.getConfirmedSignaturesForAddress2Error(message: "Please enter a valid pubkey")))
            return
        }
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getConfirmedSignaturesForAddress2",
            "params": [
                address,
                [
                    "limit": config?.limit as Any,
                    "before": config?.before as Any,
                    "until": config?.until as Any
                ]
            ]
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetConfirmedSignaturesForAddress2Response>, Error>) in
            switch result {
            case .failure(let error):
                // Log `people` related network errors here if needed.
                completion(.failure(.getConfirmedSignaturesForAddress2Error(message: error.localizedDescription)))
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    public func getConfirmedTransaction(transaction: String, encoding: Encoding? = .json, completion: @escaping (Result<Networking.Response<GetConfirmedTransactionResponse>, SolanaAPIError>) -> Void) {
        
        // Simple sanity checking.
        guard transaction.count > 0 else {
            completion(.failure(.getConfirmedTransactionError(message: "Please enter a valid pubkey")))
            return
        }
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getConfirmedTransaction",
            "params": [
                transaction,
                encoding?.rawValue
            ]
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetConfirmedTransactionResponse>, Error>) in
            switch result {
            case .failure(let error):
                // Log `people` related network errors here if needed.
                completion(.failure(.getConfirmedTransactionError(message: error.localizedDescription)))
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    public func getEpochInfo(commitment: Commitment? = nil, completion: @escaping (Result<Networking.Response<GetEpochInfoResponse>, SolanaAPIError>) -> Void) {
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getEpochInfo",
            "params": [
                [
                    "commitment": commitment?.rawValue
                ]
            ]
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetEpochInfoResponse>, Error>) in
            switch result {
            case .failure(let error):
                // Log `people` related network errors here if needed.
                completion(.failure(.getEpochInfoError(message: error.localizedDescription)))
            case .success(let res):
                completion(.success(res))
            }
        }
    }
}
