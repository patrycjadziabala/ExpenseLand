//
//  Models.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import Foundation

struct Category {
    let id: UUID
    let categoryName: String
    let categoryAmount: Double
    let categoryIcon: String
    let categoryColor: String
    let categoryExpense: String
}

struct Expense {
    let id: UUID
    let expenseName: String
    let expenseAmount: String
    let expenseDate: Date
    let expenseDescription: String
    let expenseCategory: String
}
