//
//  Expenses.swift
//  7 iExpense for iOS 17
//
//  Created by Marcin Frydrych on 13/01/2024.
//

import SwiftData
import SwiftUI

@Model
class ExpenseItem {
    let name: String
    let type: String
    let amount: Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}


//struct ExpenseItem: Identifiable, Codable, Equatable {
//    var id = UUID()
//    let name: String
//    let type: String
//    let amount: Double
//}

//@Observable
//class Expenses {
//    
//    var items = [ExpenseItem]() {
//        didSet {
//            if let encoded = try? JSONEncoder().encode(items) {
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//    
//    var personalItems: [ExpenseItem] {
//        items.filter { $0.type == "Personal" }
//    }
//    
//    var businessItems: [ExpenseItem] {
//        items.filter { $0.type == "Business" }
//    }
//    
//    init() {
//        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
//                items = decodedItems
//                return
//            }
//        }
//        
//        items = []
//    }
//    
//    
//}
