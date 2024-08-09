//
//  String+Extensions.swift
//  ForeCash
//
//  Created by Roman Potapov on 8/8/24.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
