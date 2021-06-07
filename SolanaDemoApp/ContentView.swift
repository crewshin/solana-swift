//
//  ContentView.swift
//  SolanaDemoApp
//
//  Created by Gene Crucean on 3/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var solana = Solana(network: .dev)
    @State var solanaSocket = SolanaSockets(network: .dev)
    @State private var networkSelection: Int = 1
    @State private var customNetworkIsSelected = false
    @State private var currentNetwork = Network.dev.url?.absoluteString ?? ""
    
    @EnvironmentObject var output: Output
    
    @State var pubkey: String = "9B5XszUGdMaxCZ7uSQhPzdks5ZQSmWxrmzCSvtJ6Ns6g"
    @State var toggleModal = false
    @State var toggleModalHidden = false
    @State var isViewingSocketData = false
    
    var body: some View {
        Form {
            
            Section(header: Text("Network")) {
                Picker(selection: $networkSelection, label: Text("Picker"), content: {
                    Text("Dev").tag(1)
                    Text("Main").tag(2)
                    Text("Test").tag(3)
                    Text("Custom").tag(4)
                })
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: networkSelection, perform: { value in
                    setNetwork()
                })
                
                TextField("http://localhost:8899", text: $currentNetwork)
                    .onChange(of: currentNetwork, perform: { value in
                        setNetwork()
                    })
                    .disabled(!customNetworkIsSelected)
                    .foregroundColor(customNetworkIsSelected ? .white : .gray)
                    
            }
            
            Section(header: Text("Pubkey")) {
                TextField("PubKey",
                    text: $pubkey
                )
                .frame(minWidth: 0, idealWidth: 375, maxWidth: .infinity, minHeight: 40, idealHeight: 40, maxHeight: 200, alignment: .leading)
            }
            
            Section(header: Text("Network Calls")) {
                
                Group {
                    Button("Get Account Info") {
                        getAccountInfo()
                    }
                    
                    Button("Get Balance") {
                        getBalance()
                    }
                    
                    Button("Get Block Commitment") {
                        getBlockCommitment()
                    }
                    
                    Button("Get Block Time") {
                        getBlockTime()
                    }
                    
                    Button("Get Cluster Nodes") {
                        getClusterNodes()
                    }
                    
                    Button("Get Confirmed Block") {
                        getConfirmedBlock()
                    }
                    
                    Button("Get Block Production") {
                        getBlockProduction()
                    }
                    
                    Button("Get Confirmed Blocks") {
                        getConfirmedBlocks()
                    }
                    
                    Button("Get Confirmed Blocks With Limit") {
                        getConfirmedBlocksWithLimit()
                    }
                    
                    Button("Get Confirmed Signatures For Address 2") {
                        getConfirmedSignaturesForAddress2()
                    }
                }
                
                Group {
                    Button("Get Confirmed Transaction") {
                        getConfirmedTransaction()
                    }
                    
                    Button("Get Epoch Info") {
                        getEpochInfo()
                    }
                    
                    Button("Get Epoch Schedule") {
                        getEpochSchedule()
                    }
                    
                    Button("Get Fee Calculator For Blockhash") {
                        getFeeCalculatorForBlockhash()
                    }
                    
                    Button("Get Fee Rate Governor") {
                        getFeeRateGovernor()
                    }
                    
                    Button("Get Fees") {
                        getFees()
                    }
                }
            }
            
            Section(header: Text("Web Sockets")) {
                Group {
                    Button("Start") {
                        testWebSocket()
                    }
                    
                    Button("Stop") {
                        solanaSocket.testWebSocketDisconnect()
                    }
                }
            }
            
            if isViewingSocketData {
                Section(header: Text("Output")) {
                    TextEditor(text: $output.value)
                        .font(.caption)
                        .foregroundColor(.pink)
                }
            }
        }
        .sheet(isPresented: isViewingSocketData ? $toggleModalHidden : $toggleModal,
               onDismiss: dismissSheet,
               content: {
                ResultView(input: output.value)
               }
            )
    }
    
    // MARK: - Result Sheet
    
    func dismissSheet() {
        toggleModal = false
        solanaSocket.testWebSocketDisconnect()
    }
    
    // MARK: - Calls
    
    func getAccountInfo() {
        solana.getAccountInfo(pubkey: pubkey) { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getAccountInfoError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getBalance() {
        solana.getBalance(pubkeys: [pubkey]) { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getBalanceError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getBlockCommitment() {
        solana.getBlockCommitment(blocks: [41901216]) { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getBlockCommitmentError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getBlockTime() {
        solana.getBlockTime(blocks: [41901216]) { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getBlockTimeError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getClusterNodes() {
        solana.getClusterNodes() { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getClusterNodesError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getConfirmedBlock() {
        solana.getConfirmedBlock(slot: 48441492) { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getConfirmedBlockError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getBlockProduction() {
        solana.getBlockProduction(commitment: .finalized, slotRange: SlotRange(firstSlot: 55579597, lastSlot: 55579600), identity: nil) { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getBlockProductionError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getConfirmedBlocks() {
        solana.getConfirmedBlocks(startSlot: 5, endSlot: 20) { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getConfirmedBlocksError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getConfirmedBlocksWithLimit() {
        solana.getConfirmedBlocksWithLimit(startSlot: 1, limit: 5) { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getConfirmedBlocksWithLimitError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    // Need to confirm success response.
    func getConfirmedSignaturesForAddress2() {
        solana.getConfirmedSignaturesForAddress2(address: pubkey, config: nil) { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getConfirmedSignaturesForAddress2Error(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getConfirmedTransaction() {
        solana.getConfirmedTransaction(transaction: "5oxHqnr7cNn9kZGfnV7mvZWNB4hp5vgcmPi8jtcaEY9PjohueEpNB5xC14eqVzLUoooE1rctSc91mFhnigpvDt5V") { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getConfirmedTransactionError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getEpochInfo() {
        solana.getEpochInfo(commitment: .finalized) { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getEpochInfoError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getEpochSchedule() {
        solana.getEpochSchedule() { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getEpochScheduleError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getFeeCalculatorForBlockhash() {
        solana.getFeeCalculatorFor(blockhash: "6bERxmpFyJrdKWneWMyUWTvZx563qssYjGQn4S2sXWMY") { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getFeeCalculatorForBlockhashError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getFeeRateGovernor() {
        solana.getFeeRateGovernor() { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getFeeRateGovernorError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    func getFees() {
        solana.getFees(commitment: .finalized) { (result) in
            isViewingSocketData = false
            
            switch result {
            case .failure(let error):
                if case let SolanaAPIError.getFeesError(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                DispatchQueue.main.async {
                    output.value = "\(response.value.asDictionary ?? [:])"
                }
                toggleModal.toggle()
            }
        }
    }
    
    
    // MARK: - WebSockets
    
    func testWebSocket() {
        solanaSocket.delegate = self
        isViewingSocketData.toggle()
        solanaSocket.testWebSocket(request: nil)
    }
    
    // MARK: - Misc demo app helpers
    
    func setNetwork() {
        switch networkSelection {
        case 1:
            solana = Solana(network: .dev)
            solanaSocket = SolanaSockets(network: .dev)
            customNetworkIsSelected = false
            currentNetwork = Network.dev.url?.absoluteString ?? ""
        case 2:
            solana = Solana(network: .main)
            solanaSocket = SolanaSockets(network: .main)
            customNetworkIsSelected = false
            currentNetwork = Network.main.url?.absoluteString ?? ""
        case 3:
            solana = Solana(network: .test)
            solanaSocket = SolanaSockets(network: .test)
            customNetworkIsSelected = false
            currentNetwork = Network.test.url?.absoluteString ?? ""
        case 4:
            solana = Solana(network: .custom(network: currentNetwork))
            solanaSocket = SolanaSockets(network: .custom(network: currentNetwork))
            customNetworkIsSelected = true
            currentNetwork = "http://{ip-to-solana-cluster}:8899"
        default:
            solana = Solana(network: .dev)
            solanaSocket = SolanaSockets(network: .dev)
            customNetworkIsSelected = false
            currentNetwork = Network.dev.url?.absoluteString ?? ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            pubkey: "9B5XszUGdMaxCZ7uSQhPzdks5ZQSmWxrmzCSvtJ6Ns6g"
        )
    }
}

extension ContentView: SolanaDelegate {
    func receivedMessage<T>(message: T) where T : Decodable, T : Encodable {
        if let message = message as? String {
            DispatchQueue.main.async {
                output.value = message
            }
        }
    }
    
    func disconnected() {}
}
