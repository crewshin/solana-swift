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
    
    /// Returns all account information associated with the account of provided pubkey.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getaccountinfo
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
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getAccountInfoError(message: message)))
                } else {
                    completion(.failure(.getAccountInfoError(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }

    /// Returns the balance of the provided pubkeys.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getbalance
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
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getBalanceError(message: message)))
                } else {
                    completion(.failure(.getBalanceError(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    /// Returns the block commitment for the provided blocks.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getblockcommitment
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
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getBlockCommitmentError(message: message)))
                } else {
                    completion(.failure(.getBlockCommitmentError(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    /// Returns the block time for the provided blocks.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getblocktime
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
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getBlockTimeError(message: message)))
                } else {
                    completion(.failure(.getBlockTimeError(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    /// Returns the cluster nodes.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getclusternodes
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
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getClusterNodesError(message: message)))
                } else {
                    completion(.failure(.getClusterNodesError(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    /// Returns the block for the provided slot.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getconfirmedblock
    /// NOTE: Only json encoding is supported at this time.
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
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getConfirmedBlockError(message: message)))
                } else {
                    completion(.failure(.getConfirmedBlockError(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    /// Returns the confirmed blocks for the provided start/end slots.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getconfirmedblocks
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
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getConfirmedBlocksError(message: message)))
                } else {
                    completion(.failure(.getConfirmedBlocksError(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    /// Returns the confirmed blocks from the provided start slot with limit.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getconfirmedblockswithlimit
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
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getConfirmedBlocksWithLimitError(message: message)))
                } else {
                    completion(.failure(.getConfirmedBlocksWithLimitError(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    /// Returns the confirmed signatures for the given params.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getconfirmedsignaturesforaddress
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
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getConfirmedSignaturesForAddressError(message: message)))
                } else {
                    completion(.failure(.getConfirmedSignaturesForAddressError(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    /// Returns the confirmed signatures for the given params.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getconfirmedsignaturesforaddress2
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
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getConfirmedSignaturesForAddress2Error(message: message)))
                } else {
                    completion(.failure(.getConfirmedSignaturesForAddress2Error(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    /// Returns the confirmed transaction.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getconfirmedtransaction
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
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getConfirmedTransactionError(message: message)))
                } else {
                    completion(.failure(.getConfirmedTransactionError(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    /// Returns the epoch info for the provided commitment.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getepochinfo
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
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getEpochInfoError(message: message)))
                } else {
                    completion(.failure(.getEpochInfoError(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    /// Returns the epoch schedule.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getepochschedule
    public func getEpochSchedule(completion: @escaping (Result<Networking.Response<GetEpochScheduleResponse>, SolanaAPIError>) -> Void) {
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getEpochSchedule",
            "params": []
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetEpochScheduleResponse>, Error>) in
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getEpochScheduleError(message: message)))
                } else {
                    completion(.failure(.getEpochScheduleError(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }
    
    /// Returns the fee calculator for blockhash.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getfeecalculatorforblockhash
    public func getFeeCalculatorFor(blockhash: String, completion: @escaping (Result<Networking.Response<GetFeeCalculatorForBlockhashResponse>, SolanaAPIError>) -> Void) {
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "getFeeCalculatorForBlockhash",
            "params": [
                blockhash
            ]
        ]
        
        var request = URLRequest(url: networkURL)
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue

        networking.decodableTask(request: request) { (result: Result<Networking.Response<GetFeeCalculatorForBlockhashResponse>, Error>) in
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.generic(message) = error {
                    completion(.failure(.getFeeCalculatorForBlockhashError(message: message)))
                } else {
                    completion(.failure(.getFeeCalculatorForBlockhashError(message: error.localizedDescription)))
                }
            case .success(let res):
                completion(.success(res))
            }
        }
    }
}
