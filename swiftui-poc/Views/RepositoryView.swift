//
//  RepositoryView.swift
//  swiftui-poc
//
//  Created by Rodolfo Ramírez Cedillo on 03/06/24.
//

import SwiftUI

struct RepositoryView: View {
    let viewModel: AccountViewModel
    
    var body: some View {
        Text("Test API Calls")
        if let repository = viewModel.repository {
            VStack {
                Text("\(repository.id)")
                Text(repository.name)
                Text(repository.owner.url)
            }
        }
        
    }
}
