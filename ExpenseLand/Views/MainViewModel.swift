//
//  MainViewModel.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    let persistanceController = PersistenceController.shared
    
    func saveExpense(description: String, amount: Double, date: Date, category: String) {
        persistanceController.saveExpense(description: description, amount: amount, date: date, category: category)
        print(persistanceController.fetchExpenses())
    }
    
    
}
