//
//  TransactionsScreen.swift
//  ForeCash
//
//  Created by Roman Potapov on 7/29/24.
//

import SwiftUI
import SwiftData


struct TransactionsScreen: View {
    let currencyStyle = Decimal.FormatStyle.Currency(code: "USD")
        
    @Query private var transactions: [Transaction]
    
//    private var transaction: Transaction
    
    @State private var date: Date = .now
    @State private var descr: String = ""
    @State private var vendor: String = ""
    @State private var amount: Double = 0.00
    @State private var account: String = ""
    @State private var frequency: String = ""
    @State private var direction: String = ""
    @State private var probability: String = ""
    @State private var category: String = ""
    
    
    
        @State private var isNewTransactionAlertPresented: Bool = false
        @State private var selectedTransaction: Transaction?
        @State private var showTransactionEditScreen: Bool = false
        
        @State private var isPresented: Bool = false
        
    private var isFormValid: Bool {
        !descr.isEmptyOrWhiteSpace
    }
    
//    private func saveTransaction() {
//        var trx = Transaction(date: date, descr: descr, vendor: vendor, amount: amount, account: account, frequency: frequency, direction: direction, probability: probability, category: category)
//        transactions.append(trx)
//    }
    
    private func isTransactionSelected(_ transaction: Transaction) -> Bool {
        transaction.persistentModelID == selectedTransaction?.persistentModelID
    }
        
        var body: some View {
            VStack {
                List(transactions) { transaction in
                    
                    TransactionLineView(transaction: transaction, isSelected: isTransactionSelected(transaction)) { event in
                        switch event {
                        case .onSelect(let transaction):
                            selectedTransaction = transaction
                        case .onInfoSelected(let transaction):
                            showTransactionEditScreen = true
                            selectedTransaction = transaction
                        }
                    }
                }
                
                
                    .navigationTitle("Transactions")
                    .sheet(isPresented: $showTransactionEditScreen, content: {
                        if let selectedTransaction {
                            NavigationStack {
                                TransactionEditScreen(transaction: selectedTransaction)
                            }
                        }
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                NavigationLink("New Transaction") {
                        AddTransactionScreen()
                    }
                
                }
           
            }
        }
    

struct TransactionsScreenContainer: View {
    
    @Query private var transactions: [Transaction]
    
    var body: some View {
        TransactionsScreen()
    }
}

#Preview { @MainActor in
    NavigationStack {
        TransactionsScreenContainer()
            .modelContainer(previewContainer)
    }
}

