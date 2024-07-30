//
//  AddTransactionScreen.swift
//  ForeCash
//
//  Created by Roman Potapov on 7/29/24.
//

import SwiftUI

struct AddTransactionScreen: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//    private func addTransaction() {
//        withAnimation {
//            let newTransaction = Transaction(timestamp: Date(), amount: Double(), account: String())
//            modelContext.insert(newTransaction)
//        }
//    }
//
//    private func deleteTransactions(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(transactions[index])
//            }
//        }
//    }



//NavigationLink {
//    Text(trx.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//} label: {
//    Text("Transaction at \(trx.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard)) for \(trx.amount)")
//}
//}

#Preview {
    AddTransactionScreen()
}
