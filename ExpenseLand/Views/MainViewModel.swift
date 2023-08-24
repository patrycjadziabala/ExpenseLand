//
//  MainViewModel.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    let persistanceController = PersistenceController.shared
    @Published var shouldPresentWelcomeScreen: Bool = false
    
    init() {
       shouldPresentWelcomeScreen = shouldPresentWelcomeView()
    }
    
    func saveExpense(description: String, amount: Double, date: Date, category: String) {
        persistanceController.saveExpense(description: description, amount: amount, date: date, category: category)
        print(persistanceController.fetchExpenses())
    }
    
    func saveBaseCategoriesOnFirstLaunch(groceries: Double) {
        guard shouldPresentWelcomeScreen == true else {
            return
        }
        
        for category in CategoryName.allCases {
            switch category {
            case .Groceries:
                persistanceController.saveCategory(amount: groceries, color: "red", name: category.stringValue, icon: "home.fill")
            }
        }
        
        UserDefaults.standard.set(true, forKey: "BaseCategoriesAlreadySaved")
        
        shouldPresentWelcomeScreen = false
    }

    func shouldPresentWelcomeView() -> Bool {
        if UserDefaults.standard.object(forKey: "BaseCategoriesAlreadySaved") == nil {
         return true
        } else {
            return false
        }
    }
}
