//
//  AccountsListView.swift
//  swiftui-poc
//
//  Created by Rodolfo Ramírez Cedillo on 20/05/24.
//

import Foundation
import SwiftUI

struct AccountsListView: View {
    let accounts: [Account]
    
    var body: some View {
        List(accounts) { account in
            VStack(content: {
                Text(account.name)
                Text(account.address)
                Text(account.accountType.rawValue)
            })
        }
        .navigationTitle("Accounts List")
    }
}
