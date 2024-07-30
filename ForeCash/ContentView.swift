//
//  ContentView.swift
//  ForeCash
//
//  Created by Roman Potapov on 7/29/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var transactions: [Transaction]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(transactions) { trx in
                    NavigationLink {
                        Text("Transaction at \(trx.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(trx.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteTransactions)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addTransaction) {
                        Label("Add Transaction", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a transaction")
        }
    }

    private func addTransaction() {
        withAnimation {
            let newTransaction = Transaction(timestamp: Date())
            modelContext.insert(newTransaction)
        }
    }

    private func deleteTransactions(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(transactions[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Transaction.self, inMemory: true)
}
