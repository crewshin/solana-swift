//
//  SolanaSockets.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/14/21.
//

import Foundation

public class SolanaSockets {
    private let websockets: WebSockets
    private var networkURL: URL
    private let jsonrpc = "2.0"
    
    public var delegate: SolanaDelegate?
    
    public init(network: Network, websockets: WebSockets = WebSockets()) {
        self.networkURL = URL(string: network.rawValue)!
        self.websockets = websockets
    }
    
    public func testWebSocket(request: TestRequest?) -> Void {
        
        let body: [String: Any] = [
            "jsonrpc": jsonrpc,
            "id": 1,
            "method": "slotSubscribe"
        ]
        
        var request = URLRequest(url: networkURL.appendingPathComponent(":8900"))
        request.httpBody = body.convertDictToJsonData()
        request.httpMethod = HTTPRequestType.post.rawValue
        
        let payload = TestRequest(test: "FOO")
        
        websockets.delegate = self
        websockets.webSocketTask(request: request, payload: payload)
    }
    
    public func testWebSocketDisconnect() {
        websockets.disconnect()
    }
}

extension SolanaSockets: WebSocketsDelegate {
    func recievedMessage<T>(message: T) where T : Decodable, T : Encodable {
        delegate?.receivedMessage(message: message)
    }
    
    func disconnected() {
        delegate?.disconnected()
    }
}
