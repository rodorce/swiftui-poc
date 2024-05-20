//
//  Account.swift
//  swiftui-poc
//
//  Created by Rodolfo Ramírez Cedillo on 20/05/24.
//

import Foundation

// MARK: - WelcomeElement
struct Account: Identifiable, Codable {
    let id: Int
    let name, address: String
    let accountType: AccountType
}

enum AccountType: String, Codable {
    case type1 = "Type 1"
    case type2 = "Type 2"
}

typealias Accounts = [Account]
