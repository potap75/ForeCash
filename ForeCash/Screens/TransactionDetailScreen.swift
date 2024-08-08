//
//  TransactionDetailScreen.swift
//  ForeCash
//
//  Created by Roman Potapov on 8/7/24.
//

import SwiftUI
import SwiftData

struct TransactionDetailScreen: View {
    
    let transaction: Transaction
    let transactions: [Transaction]
    
    var body: some View {
        VStack {
            Text(transaction.date, format: .dateTime)
            Text(transaction.descr)
            Text(transaction.vendor ?? "Unknown")
            Text(transaction.amount, format: .number)
            Text(transaction.account)
            Text(transaction.frequency ?? "Any")
            Text(transaction.direction ?? "Expense")
            Text(transaction.probability ?? "Varies")
            Text(transaction.category ?? "Miscellaneous")
            
            
        }.navigationTitle(transaction.descr)
    }
}

struct TransactionDetailScreenContainer: View {
    
    @Query(sort: \Transaction.date) private var trxs: [Transaction]
    
    var body: some View {
        TransactionDetailScreen(transaction: trxs[0], transactions: trxs)
    }
}

#Preview { @MainActor in
    NavigationStack {
        TransactionDetailScreenContainer()
    }.modelContainer(previewContainer)
}
