//
//  WebSockets.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/14/21.
//

import Foundation

protocol WebSocketsDelegate: AnyObject {
    func recievedMessage<T: Codable>(message: T)
    func disconnected()
}

public class WebSockets {
    
    var task: URLSessionWebSocketTask?
    var delegate: WebSocketsDelegate?
    
    public init() {}
    
    public func webSocketTask<Req: Codable>(request: URLRequest, payload: Req, decoder: JSONDecoder = JSONDecoder()) -> Void {
        let task = URLSession.shared.webSocketTask(with: request)
        self.task = task
        task.resume()
        
        if let jsonData = try? JSONEncoder().encode(payload) {
            task.send(.data(jsonData)) { (error) in
                if let error = error {
                    print(error)
                }
            }
            
            receiveMessage()
        }
    }
    
    private func receiveMessage() {
        guard let task = self.task else { return }
        
        task.receive { (result) in
            switch result {
            case .failure:
                self.disconnect()
                self.delegate?.disconnected()
            case .success(let message):
                self.processMessage(message: message)
                self.receiveMessage()
            }
        }
    }
    
    private func processMessage(message: URLSessionWebSocketTask.Message) {
        switch message {
        case .string(let jsonString):
            self.delegate?.recievedMessage(message: jsonString)
        case .data(let data):
            if let _data = try? JSONDecoder().decode(TestResponse.self, from: data) { // ToDo: Need to make this generic.
                self.delegate?.recievedMessage(message: _data)
            }
        default:
            break
        }
    }
    
    public func disconnect() {
        task?.cancel()
        task = nil
        delegate?.disconnected()
    }
}
