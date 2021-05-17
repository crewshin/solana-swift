//
//  SolanaErrors.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/14/21.
//

import Foundation

public enum SolanaAPIError: Error {
    case generic(message: String)
    case getAccountInfoError(message: String)
    case getBalanceError(message: String)
    case getBlockCommitmentError(message: String)
    case getBlockTimeError(message: String)
    case getClusterNodesError(message: String)
    case getConfirmedBlockError(message: String)
    case getBlockProductionError(message: String)
    case getConfirmedBlocksError(message: String)
    case getConfirmedBlocksWithLimitError(message: String)
    case getConfirmedSignaturesForAddressError(message: String)
    case getConfirmedSignaturesForAddress2Error(message: String)
    case getConfirmedTransactionError(message: String)
    case getEpochInfoError(message: String)
    case getEpochScheduleError(message: String)
    case getFeeCalculatorForBlockhashError(message: String)
    case getFeeRateGovernorError(message: String)
    
    case simulateTransactionError(message: String)
}
