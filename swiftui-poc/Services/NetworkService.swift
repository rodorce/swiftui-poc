//
//  NetworkService.swift
//  swiftui-poc
//
//  Created by Rodolfo Ramírez Cedillo on 20/05/24.
//

import Foundation
import Combine

class NetworkService {
    
    @Published var accounts: [Account] = []
    @Published var accountHeaderBox: [String:AccountHeaderBox] = [:]
    var accountsSubscription: AnyCancellable?
    var accountHeaderBoxSubscription: AnyCancellable?
    
    init() {
        getAccountData()
        getAllHeaderBoxes()
    }
    
    private func getAccountData() {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            fatalError("Could not find data.json in the bundle.")
        }
        accountsSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Account].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Successfully received and parsed JSON.")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] accounts in
                self?.accounts = accounts
                self?.accountsSubscription?.cancel()
            })
    }
    
    private func getAccountHeaderBox(byRole: String) -> AnyPublisher<AccountHeaderBox, Error> {
        guard let url = Bundle.main.url(forResource: byRole, withExtension: "json") else {
            fatalError("Could not find data.json in the bundle.")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: AccountHeaderBox.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private func getAllHeaderBoxes() {
        let mdmData = getAccountHeaderBox(byRole: "MDM")
        let namData = getAccountHeaderBox(byRole: "NAM")
        let onPremData = getAccountHeaderBox(byRole: "OnPrem")
        accountHeaderBoxSubscription = Publishers.CombineLatest3(mdmData, namData, onPremData)
            .map { mdm, nam, onPrem in
                return [
                    "MDM": mdm,
                    "NAM": nam,
                    "OnPrem": onPrem
                ]
            }
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("Successfully received and parsed JSON.")
            case .failure(let error):
                print("Error: \(error)")
            }
        }, receiveValue: { [weak self] accountHeaderBox in
            self?.accountHeaderBox = accountHeaderBox
            self?.accountHeaderBoxSubscription?.cancel()
        })
    }
}
