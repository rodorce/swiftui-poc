//
//  HomeView.swift
//  swiftui-poc
//
//  Created by Rodolfo Ramírez Cedillo on 20/05/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AccountViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background_image")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Section {
                        NavigationLink(destination: AccountsView(viewModel: viewModel, role: "MDM")) {
                            Text("MDM")
                                .font(.title)
                        }
                        .modifier(NavigationLinkModifier())
                        NavigationLink(destination: AccountsView(viewModel: viewModel, role: "NAM")) {
                            Text("NAM")
                                .font(.title)
                        }
                        .modifier(NavigationLinkModifier())
                        NavigationLink(destination: AccountsView(viewModel: viewModel, role: "OnPrem")) {
                            Text("OnPrem")
                                .font(.title)
                        }
                        .modifier(NavigationLinkModifier())
                    } header: {
                        Text("Experience")
                            .font(.system(size: 60))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .bold()
                            .padding(.vertical)
                            .padding()
                            .shadow(color: .yellow, radius: 5)
                    }
                }
                .padding()
            }
        }
    }
}


#Preview {
    HomeView()
        .environmentObject(AccountViewModel())
}
