//
//  AccountViewModel.swift
//  swiftui-poc
//
//  Created by Rodolfo Ramírez Cedillo on 20/05/24.
//

import Foundation
import Combine

class AccountViewModel: ObservableObject {
    @Published var accounts: [Account] = []
    
    private let networkService = NetworkService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        networkService.$accounts
            .sink { [weak self] returnedAccounts in
                self?.accounts = returnedAccounts
            }
            .store(in: &cancellables)
    }
}
