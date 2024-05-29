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
    @Published var roleHeaderBoxes: [String: AccountHeaderBox] = [:]
    private let networkService = NetworkService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
        createAccountHeaderBox()
    }
    
    private func addSubscribers() {
        networkService.$accounts
            .sink { [weak self] returnedAccounts in
                self?.accounts = returnedAccounts
            }
            .store(in: &cancellables)
    }
    
    private func createAccountHeaderBox() {
        networkService.$accountHeaderBox
            .sink { [weak self] returnedHeaderBox in
                self?.roleHeaderBoxes = returnedHeaderBox
            }
            .store(in: &cancellables)
    }
}
