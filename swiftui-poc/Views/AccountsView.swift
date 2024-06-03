//
//  AccountsView.swift
//  swiftui-poc
//
//  Created by Rodolfo Ramírez Cedillo on 29/05/24.
//

import SwiftUI

struct AccountsView: View {
    @ObservedObject var viewModel: AccountViewModel
    let role: String

    var body: some View {
        VStack {
            if let header = viewModel.roleHeaderBoxes[role] {
                Text("\(header.accountName) / \(header.tdlinx)")
                Text(header.address)
                Text(header.updateDate)
            
            VStack {
                    ForEach(header.sectionsOrder, id: \.self) { value in
                        VStack {
                            Text(value)
                                .font(.title)
                                .foregroundStyle(.white)
                        }
                        .padding()
                        .background(.black)
                    }
                }
            .padding()
            }
        }
    }
}
