//
//  Models.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import Foundation

struct Category: Hashable, Identifiable {
    let id: UUID
    let categoryName: String
    let categoryAmount: Double
    let categoryIcon: String
    let categoryColor: String
    let categoryExpense: [Expense]
}

struct Expense: Hashable, Identifiable {
    let id: UUID
    let expenseAmount: Double
    let expenseDate: Date
    let expenseDescription: String
    let expenseCategory: String
}

enum CategoryName: CaseIterable {
    case Groceries
    case Bills
    case Transport
    case Holiday
    case Health
    case Subscriptions
    case Loans
    case Shopping
    
    var stringValue: String {
        switch self {
        case .Groceries: return "groceries"
        case .Bills: return "bills"
        case .Transport: return "transport"
        case .Holiday: return "holiday"
        case .Health: return "health"
        case .Subscriptions: return "subscriptions"
        case .Loans: return "loans"
        case .Shopping: return "shopping"
        }
    }
}
