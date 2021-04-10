//
//  TransactionError.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/11/21.
//

import Foundation

public enum TransactionError: String, Codable {
    case AccountInUse
    case AccountLoadedTwice
    case AccountNotFound
    case ProgramAccountNotFound
    case InsufficientFundsForFee
    case InvalidAccountForFee
    case DuplicateSignature
    case BlockhashNotFound
    case InstructionError
    case CallChainTooDeep
    case MissingSignatureForFee
    case InvalidAccountIndex
    case SignatureFailure
    case InvalidProgramForExecution
    case SanitizeFailure
    case ClusterMaintenance
}
