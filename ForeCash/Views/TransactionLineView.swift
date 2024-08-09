//
//  TransactionLineView.swift
//  ForeCash
//
//  Created by Roman Potapov on 8/8/24.
//

import SwiftUI
import SwiftData

enum TransactionLineEvents {
//    case onChecked(Transaction, Bool)
    case onSelect(Transaction)
    case onInfoSelected(Transaction)
}

struct TransactionLineView: View {
    
    let transaction: Transaction
    let isSelected: Bool
    let onEvent: (TransactionLineEvents) -> Void
    //    @State private var checked: Bool = false
    
    
    var body: some View {
        
        VStack {
            HStack {
                Text(transaction.descr)
                    .frame(maxWidth: .infinity, alignment: .leading )
                Spacer(minLength: 5)
                Text(transaction.amount, format: .currency(code: "USD"))
            }
            
            HStack {
                if let trxCategory = transaction.category {
                    Text(trxCategory)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
                
                if let trxVendor = transaction.vendor {
                    Text("Vendor: \(trxVendor)")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            
            HStack {
                
                Text(transaction.date.formatted(date: .numeric, time: .omitted))
                
                
                if let trxFrequency = transaction.frequency {
                    Text("Pay frequency: \(trxFrequency)")
                    
                }
                
                Spacer()
                
                if let trxAccount = transaction.account {
                    Text("Paid with: \(trxAccount)")
                    
                }
            }
            .font(.caption)
            .foregroundStyle(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            Image(systemName: "info.circle.fill")
                .opacity(isSelected ? 1: 0)
                .onTapGesture {
                    onEvent(.onInfoSelected(transaction))
                }
        }.contentShape(Rectangle())
            .onTapGesture {
                onEvent(.onSelect(transaction))
            }
    }
}

struct ReminderCellViewContainer: View {
    
    @Query(sort: \Transaction.date) private var transactions: [Transaction]
    
    var body: some View {
        
        TransactionLineView(transaction: transactions[0], isSelected: false) {_ in
            
        }
    }
}

#Preview { @MainActor in
    ReminderCellViewContainer()
        .modelContainer(previewContainer)
}
