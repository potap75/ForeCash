//
//  TransactionEditScreen.swift
//  ForeCash
//
//  Created by Roman Potapov on 8/9/24.
//

import SwiftUI
import SwiftData

struct TransactionEditScreen: View {
    let transaction: Transaction
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TransactionEditScreenContainer: View {
    
    @Query(sort: \Transaction.descr) private var transactions: [Transaction]
    
    var body: some View {
        TransactionEditScreen(transaction: transactions[0])
    }
}

#Preview {
    NavigationStack {
        TransactionEditScreenContainer()
            .modelContainer(previewContainer)
    }
}
