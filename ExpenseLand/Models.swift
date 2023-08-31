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
    let categoryExpenseTotalAmount: Double
    let categoryExpensesPercentage: Double
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
    
    var icon: String {
        switch self {
        case .Groceries: return "cart"
        case .Bills: return "dollarsign.circle"
        case .Transport: return "car"
        case .Holiday: return "suitcase.rolling"
        case .Health: return "bandage"
        case .Subscriptions: return "clock.arrow.2.circlepath"
        case .Loans: return "creditcard"
        case .Shopping: return "bag"
        }
    }
    
    var color: String {
        switch self {
        case .Groceries: return Constants.Colors.customBlue
        case .Bills: return Constants.Colors.customFadedGreen
        case .Transport: return Constants.Colors.customLightBlue
        case .Holiday: return Constants.Colors.customLightGreen
        case .Health: return Constants.Colors.customLightPink
        case .Subscriptions: return Constants.Colors.customLightYellow
        case .Loans: return Constants.Colors.customLightPurple
        case .Shopping: return Constants.Colors.customOrange
        }
    }
}
