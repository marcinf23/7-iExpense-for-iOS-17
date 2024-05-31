//
//  ExpenseSection.swift
//  7 iExpense for iOS 17
//
//  Created by Marcin Frydrych on 14/01/2024.
//

import SwiftUI
import SwiftData

struct ExpensesList: View {
//    let title: String
//    let expenses: [ExpenseItem]
//    let deleteItems: (IndexSet) -> Void
    @Query private var expenses: [ExpenseItem]
    @Environment(\.modelContext) private var modelContext
    
    let localCurrency = Locale.current.currency?.identifier ?? "USD"

    
    var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: localCurrency))
                        .style(for: item)
                }
            }
            .onDelete(perform: removeItems)
        }
    }
    
    init(type: String = "All", sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(filter: #Predicate {
            if type == "All" {
                return true
            } else {
                return $0.type == type
            }
        }, sort: sortOrder)
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let item = expenses[offset]
            
            modelContext.delete(item)
        }
    }
}

#Preview {
    ExpensesList(sortOrder: [SortDescriptor(\.name)])
        .modelContainer(for: ExpenseItem.self)
}
