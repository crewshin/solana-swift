//
//  Account.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/14/21.
//

import Foundation
import ed25519swift

public struct Account: Codable {
    let publicKey: [UInt8]
    let privateKey: [UInt8]
    
    public static func newAccount() -> Account {
        let keys = Ed25519.generateKeyPair()
        return Account(publicKey: keys.publicKey, privateKey: keys.secretKey)
    }
    
    public static func accountFromPrivateKey(privateKey: [UInt8]) -> Account {
        return Account(
            publicKey: Ed25519.calcPublicKey(secretKey: privateKey),
            privateKey: privateKey
        )
    }
}

public struct AccountMeta: Codable {
    let publicKey: [UInt8]
    let isSigner: Bool
    let isWritable: Bool
}
