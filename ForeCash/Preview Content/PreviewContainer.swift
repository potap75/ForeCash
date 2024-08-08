//
//  PreviewContainer.swift
//  ForeCash
//
//  Created by Roman Potapov on 7/29/24.
//


import Foundation
import SwiftData


@MainActor
var previewContainer: ModelContainer = {
    
    let container = try! ModelContainer(for: Transaction.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for transaction in SampleData.transactions{
        container.mainContext.insert(transaction)
    }
    
    return container
}()


// MARK: - SAMPLE DATA

struct SampleData {
    static var transactions: [Transaction] {
        return [
            Transaction(date: Date(), descr: "Pants", vendor: "Walmart", amount: -25.45, account: "Cash", frequency: "Any", direction: "Expense", probability: "Varies", category: "Clothes"),
            Transaction(date: Date(), descr: "Electricity", vendor: "Duke", amount: -125.25, account: "Bank 1", frequency: "Monthly", direction: "Expense", probability: "Bill", category: "Utilities"),
            Transaction(date: Date(), descr: "Salary for July 1-15", vendor: "Work", amount: 3210.20, account: "Bank 2", frequency: "Bi-weekly", direction: "Income", probability: "Auto", category: "Salary"),
            Transaction(date: Date(), descr: "Auto insurance July", vendor: "Allstate", amount: -82.15, account: "Bank 1", frequency: "Monthly", direction: "Expense", probability: "Auto", category: "Insurance"),
        ]
    }
}
