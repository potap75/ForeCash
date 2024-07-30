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
            Transaction(amount: 25.45, account: "Cash"),
            Transaction(amount: 45.25, account: "Bank"),
            Transaction(amount: 210.20, account: "Card"),
            Transaction(amount: -150.15, account: "Loan"),
        ]
    }
}
