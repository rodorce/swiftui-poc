//
//  ViewHelpers.swift
//  swiftui-poc
//
//  Created by Rodolfo Ramírez Cedillo on 20/05/24.
//

import SwiftUI

struct NavigationLinkModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .foregroundStyle(.white)
            .background(.black)
            .clipShape(.buttonBorder)
            .padding(.vertical)
    }
}
