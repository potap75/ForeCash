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
    var amount: Double
    var account: String
    
    
//    var amountString: String { amount }
    
    init(amount: Double, account: String) {
        self.amount = amount
        self.account = account
    }
    
    
}
