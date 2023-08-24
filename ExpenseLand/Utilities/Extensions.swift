//
//  Extensions.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import Foundation

extension DateFormatter {
    static let allNumeric: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        
        return formatter
    }()
}

extension Date {
    func toString() -> String {
        DateFormatter.allNumeric.string(from: self)
    }
}
