//
//  AccountHeaderBox.swift
//  swiftui-poc
//
//  Created by Rodolfo Ramírez Cedillo on 29/05/24.
//

import Foundation

struct AccountHeaderBox: Codable {
    let accountName: String
    let tdlinx: Int
    let address, updateDate: String
    let sectionsOrder: [String]
}
