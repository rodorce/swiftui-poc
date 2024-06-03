//
//  RepositoryDataService.swift
//  swiftui-poc
//
//  Created by Rodolfo Ramírez Cedillo on 03/06/24.
//

import Foundation
import Combine

class RepositoryDataService {
    
    @Published var repository: Repository? = nil
    var repositorySubscription: AnyCancellable?
    
    init() {
        getRepository()
    }
    
    private func getRepository() {
        guard let url = URL(string: "https://api.github.com/repos/ConstellationBrands/hackathon-resources") else { return }
        repositorySubscription = NetworkManager.download(url: url)
            .decode(type: Repository.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedRepository in
                self?.repository = returnedRepository
                self?.repositorySubscription?.cancel()
            })
    }
    
}
