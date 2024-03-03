//
//  ContentView.swift
//  7 iExpense for iOS 17
//
//  Created by Marcin Frydrych on 09/01/2024.
//
import SwiftUI




struct ContentView: View {
    @State private var expenses = Expenses()
    
    @State private var showingAddExpense = false
        
    var body: some View {
        NavigationStack {
            List {
                ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
                ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
//        expenses.items.remove(atOffsets: offsets)
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}

#Preview {
    ContentView()
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
