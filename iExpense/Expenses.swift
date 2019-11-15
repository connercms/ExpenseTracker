//
//  Expenses.swift
//  iExpense
//
//  Created by Conner Shannon on 10/30/19.
//  Copyright © 2019 Conner Shannon. All rights reserved.
//

import SwiftUI


struct ExpenseItem: Codable, Identifiable {
    let id = UUID()
    let name: String
    let personal: Bool
    let amount: Int
}


class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
            }
        }
        self.items = []
    }
}
