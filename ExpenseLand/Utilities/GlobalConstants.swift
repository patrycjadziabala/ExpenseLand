//
//  GlobalConstants.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import Foundation

struct GlobalConstants {
    
    static let baseCategories: [Category] = [Category(id: UUID(), categoryName: "Groceries", categoryAmount: 0, categoryIcon: "home.fill", categoryColor: "red", categoryExpense: [])]
}
