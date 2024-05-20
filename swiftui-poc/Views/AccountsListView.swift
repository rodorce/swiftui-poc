//
//  AccountsListView.swift
//  swiftui-poc
//
//  Created by Rodolfo Ramírez Cedillo on 20/05/24.
//

import Foundation
import SwiftUI

struct AccountsListView: View {
    @ObservedObject var viewModel: AccountViewModel
    
    var body: some View {
        List(viewModel.accounts) { account in
            VStack(content: {
                Text(account.name)
                Text(account.address)
                Text(account.accountType.rawValue)
            })
        }
        .navigationTitle("Accounts List")
    }
}
