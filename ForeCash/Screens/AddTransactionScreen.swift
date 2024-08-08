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
    
    @State private var date: Date = .now
    @State private var descr: String = ""
    @State private var vendor: String = ""
    @State private var amount: Double = 0.00
    @State private var account: String = ""
    @State private var frequency: String = ""
    @State private var direction: String = ""
    @State private var probability: String = ""
    @State private var category: String = ""
    
    var transaction: Transaction? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("Select Date", selection: $date, displayedComponents: .date)
                
                TextField("Description", text: $descr)
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading, .trailing], 44)
                
                TextField("Vendor", text: $vendor)
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading, .trailing], 44)
                
                TextField("Amount", value: $amount, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading, .trailing], 44)
                
                TextField("How paid?", text: $account)
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading, .trailing], 44)
                
                TextField("How often?", text: $frequency)
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading, .trailing], 44)
                
                TextField("Expense or income?", text: $direction)
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading, .trailing], 44)
                
                TextField("How charged?", text: $probability)
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading, .trailing], 44)
                
                TextField("Category", text: $category)
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading, .trailing], 44)
            }
        }
        .onAppear(perform: {
            if let transaction {
                date = transaction.date
                descr = transaction.descr
                vendor = transaction.vendor ?? "Unknown"
                amount = transaction.amount
                account = transaction.account
                frequency = transaction.frequency ?? "Any"
                direction = transaction.direction ?? "Expense"
                probability = transaction.probability ?? "Varies"
                category = transaction.category ?? "Miscellaneous"
                
            }
        })
        .toolbar {
            
            HStack {
                
                Button("Close") {
                    dismiss()
                }
                .frame(alignment: .trailing)
                
                
                Spacer()
                Spacer()
                
                
                
                Button("Done") {
                    
                    if let transaction {
                        transaction.date = date
                        transaction.descr = descr
                        transaction.vendor = vendor
                        transaction.amount = amount
                        transaction.account = account
                        transaction.frequency = frequency
                        transaction.direction = direction
                        transaction.probability = probability
                        transaction.category = category
                        
                    } else {
                        let transaction = Transaction(date: date, descr: descr, vendor: vendor, amount: amount, account: account, frequency: frequency, direction: direction, probability:  probability, category: category)
                        context.insert(transaction)
                    }
                    
                    dismiss()
                }
                .frame(alignment: .leading)
            }
            .navigationTitle(transaction == nil ? "New Transaction" : "Edit Transaction")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}


#Preview { @MainActor in
    NavigationStack {
        AddTransactionScreen()
    }.modelContainer(previewContainer)
}
