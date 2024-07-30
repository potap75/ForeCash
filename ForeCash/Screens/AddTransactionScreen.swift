//
//  AddTransactionScreen.swift
//  ForeCash
//
//  Created by Roman Potapov on 7/29/24.
//

import SwiftUI

struct AddTransactionScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var amount: Double?
    @State private var account: String = ""
    
    var transaction: Transaction? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Account", text: $account)
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading, .trailing], 44)
                
                TextField("Amount", value: $amount, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading, .trailing], 44)
            }
        }
        .onAppear(perform: {
            if let transaction {
                account = transaction.account
                amount = transaction.amount
            }
        })
        .navigationTitle(transaction == nil ? "New Transaction": "Edit Transaction")
        .navigationBarTitleDisplayMode(.inline)
        
        HStack {
            
            Button("Close") {
                dismiss()
            }
            .frame(alignment: .trailing)
            Spacer()
            Button("Done") {
                
                if let transaction {
                    transaction.account = account
                    transaction.amount = amount ?? 0.00
                } else {
                    let transaction = Transaction(amount: amount ?? 0.00, account: account)
                    context.insert(transaction)
                }
                
                dismiss()
            }
            .frame(alignment: .leading)
        }
        .padding()
    }
}


#Preview { @MainActor in
    NavigationStack {
        AddTransactionScreen()
    }.modelContainer(previewContainer)
}
