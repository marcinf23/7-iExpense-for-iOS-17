//
//  ContentView.swift
//  7 iExpense for iOS 17
//
//  Created by Marcin Frydrych on 09/01/2024.
//
import SwiftUI

struct ContentView: View {
    @State private var showingAddExpense = false
    @State private var expenseType = "All"
    
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
            
    var body: some View {
        NavigationStack {
            ExpensesList(type: expenseType, sortOrder: sortOrder)
                .navigationTitle("iExpense")
                .toolbar {
                    Button("Add Expense", systemImage: "plus") {
                        showingAddExpense = true
                    }
                    
                    Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("Filter", selection: $expenseType) {
                            
                            Text("Show All Expenses")
                                .tag("All")
                            Divider()
                            ForEach(AddView.types, id: \.self) { type in
                                Text(type)
                                    .tag(type)
                            }
                        }
                    }
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort by", selection: $sortOrder) {
                            Text("Name (A-Z)")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            Text("Name (Z-A)")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name, order: .reverse),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            Text("Amount (Cheapest First")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount),
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                            Text("Amount (Most Expensive First")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount, order: .reverse),
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                        }
                    }
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView()
                }
            
        }
    }
    
    
    

}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
}







/*
 struct ContentView: View {
     @State private var user = User(firstName: "Taylor", lastName: "Swift")
     
     var body: some View {
         VStack {
             Button("Save User") {
                 let encoder = JSONEncoder()
                 
                 if let data = try? encoder.encode(user) {
                     UserDefaults.standard.set(data, forKey: "UserData")
                 }
             }
         }
         .padding()
     }
 }
 
 struct User: Codable {
     let firstName: String
     let lastName: String
 }
 
 
 struct ContentView: View {
 //    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
     @AppStorage("tapCount") private var tapCount = 0
     
     var body: some View {
         VStack {
             Button("Tap Count: \(tapCount)") {
                 tapCount += 1
                 
 //                UserDefaults.standard.setValue(tapCount, forKey: "Tap")
             }
         }
         .padding()
     }
 }
 */
