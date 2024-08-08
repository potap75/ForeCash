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
    var date: Date
    var descr: String
    var vendor: String?
    var amount: Double
    var account: String
    var frequency: String?
    var direction: String?
    var probability: String?
    var category: String?
    
    
//    var amountString: String { amount }
    
    init(date: Date, descr: String, vendor: String? = "Unknown", amount: Double, account: String, frequency: String? = "Any", direction: String? = "Expense", probability: String? = "Varies", category: String? = "Miscellaneous") {
        self.date = date
        self.descr = descr
        self.vendor = vendor
        self.amount = amount
        self.account = account
        self.frequency = frequency
        self.direction = direction
        self.probability = probability
        self.category = category
        
    }
    
    
}
