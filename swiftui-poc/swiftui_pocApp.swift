//
//  swiftui_pocApp.swift
//  swiftui-poc
//
//  Created by Rodolfo Ramírez Cedillo on 06/05/24.
//

import SwiftUI

@main
struct swiftui_pocApp: App {
    var viewModel: AccountViewModel = AccountViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
