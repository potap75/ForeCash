//
//  Item.swift
//  ForeCash
//
//  Created by Roman Potapov on 7/29/24.
//

import Foundation
import SwiftData

@Model
final class Transaction {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
