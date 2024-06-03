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
    @Published var repository: Repository? = nil
    
    let urls: [URL] = [URL(string:"https://legendary-adventure-22g9q5v.pages.github.io/grid")!, URL(string:"https://legendary-adventure-22g9q5v.pages.github.io/another-grid")!]
    
    private let accountDataService = AccountsDataService()
    private let repositoryDataService = RepositoryDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
        createAccountHeaderBox()
    }
    
    private func addSubscribers() {
        accountDataService.$accounts
            .sink { [weak self] returnedAccounts in
                self?.accounts = returnedAccounts
            }
            .store(in: &cancellables)
        
        repositoryDataService.$repository
            .sink(receiveValue: {[weak self] returnedRepository in
                self?.repository = returnedRepository
            })
            .store(in: &cancellables)
    }
    
    private func createAccountHeaderBox() {
        accountDataService.$accountHeaderBox
            .sink { [weak self] returnedHeaderBox in
                self?.roleHeaderBoxes = returnedHeaderBox
            }
            .store(in: &cancellables)
    }
}
