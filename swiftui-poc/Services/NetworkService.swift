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
    var accountsSubscription: AnyCancellable?
    
    init() {
        getAccountData()
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
}
