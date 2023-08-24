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
        saveBaseCategoriesOnFirstLaunch()
    }
    
    func saveExpense(description: String, amount: Double, date: Date, category: String) {
        persistanceController.saveExpense(description: description, amount: amount, date: date, category: category)
        print(persistanceController.fetchExpenses())
    }
    
    func saveBaseCategoriesOnFirstLaunch() {
        guard shouldPresentWelcomeScreen == false else {
            return
        }
       let baseCategories: [Category] = [Category(id: UUID(), categoryName: "Groceries", categoryAmount: 0, categoryIcon: "home.fill", categoryColor: "red", categoryExpense: [])]
        
        for category in baseCategories {
            persistanceController.saveCategory(amount: category.categoryAmount, color: category.categoryColor, name: category.categoryName, icon: category.categoryIcon)
        }
        
        UserDefaults.standard.set(true, forKey: "BaseCategoriesAlreadySaved")
    }
    
    func shouldPresentWelcomeView() -> Bool {
        if UserDefaults.standard.bool(forKey: "BaseCategoriesAlreadySaved") == true {
           return false
        } else {
           return true
        }
    }
}
