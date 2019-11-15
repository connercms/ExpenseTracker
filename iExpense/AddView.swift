//
//  AddView.swift
//  iExpense
//
//  Created by Conner Shannon on 10/30/19.
//  Copyright © 2019 Conner Shannon. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var personal = true
    @State private var amount = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Expense name", text: $name)
                Toggle(isOn: $personal) {
                    Text("Personal")
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add an expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, personal: self.personal, amount: actualAmount)
                    self.expenses.items.append(item)
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
