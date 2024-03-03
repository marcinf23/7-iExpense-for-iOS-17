//
//  AddView.swift
//  7 iExpense for iOS 17
//
//  Created by Marcin Frydrych on 13/01/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
//    @State private var name = "New expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        
        Form {
            TextField("Name", text: $name)
            
            Picker("Type", selection: $type) {
                ForEach(types, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            
            TextField("Amount", value: $amount, format: .currency(code: localCurrency))
                .keyboardType(.decimalPad)
        }
        .navigationTitle("Add new expense")
//        .navigationTitle($name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement:. confirmationAction) {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel", role: .cancel) { dismiss() }
            }
        }
        
        
    }
}

#Preview {
    AddView(expenses: Expenses())
}
