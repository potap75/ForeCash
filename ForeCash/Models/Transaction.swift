//
//  Item.swift
//  ForeCash
//
//  Created by Roman Potapov on 7/29/24.
//

import Foundation
import SwiftData

@Model
class Transaction {
    var amount: Decimal
    var account: String
    
    
//    var amountString: String { amount }
    
    init(amount: Decimal, account: String) {
        self.amount = amount
        self.account = account
    }
    
    
}
