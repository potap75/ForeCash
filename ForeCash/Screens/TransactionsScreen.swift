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
        
        @State private var isPresented: Bool = false
        
       
        
        var body: some View {
            List {
                Text("Transactions")
                    .font(.largeTitle)
                    .bold()
                
                ForEach(transactions, id: \.self) {trx in
            
                    NavigationLink {
                        TransactionDetailScreen(transaction: trx, transactions: transactions)
                    } label: {
                        HStack {
                            Text(trx.account)
                            Text(trx.amount, format: .currency(code: "USD"))
                        }
                    }
            }
                Button(action: {
                    isPresented = true
                }, label: {
                    Text("Add Transaction")
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }).listRowSeparator(.hidden)
                
                
                
            }.listStyle(.plain)
                .sheet(isPresented: $isPresented, content: {
                    NavigationStack {
                        AddTransactionScreen()
                    }
                })
        }
    }

    #Preview { @MainActor in
        NavigationStack {
            TransactionsScreen()
        }.modelContainer(previewContainer)
    }

