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
    @Published var expensesShortlist: [Expense] = []
    
    init() {
       shouldPresentWelcomeScreen = shouldPresentWelcomeView()
        fetchRecentExpenses()
    }
    
    func saveExpense(description: String, amount: Double, date: Date, category: String) {
        persistanceController.saveExpense(description: description, amount: amount, date: date, category: category)
        fetchRecentExpenses()
        print(persistanceController.fetchExpenses())
    }
    
    func saveBaseCategoriesOnFirstLaunch(groceries: Double, bills: Double, health: Double, holiday: Double, loans: Double, shopping: Double, subscriptions: Double, transport: Double) {
        guard shouldPresentWelcomeScreen == true else {
            return
        }
        
        for category in CategoryName.allCases {
            switch category {
            case .Groceries:
                persistanceController.saveCategory(amount: groceries, color: "red", name: category.stringValue, icon: "cart")
            case .Bills:
                persistanceController.saveCategory(amount: bills, color: "blue", name: category.stringValue, icon: "dollarsign.circle")
            case .Health:
                persistanceController.saveCategory(amount: health, color: "green", name: category.stringValue, icon: "bandage")
            case .Holiday:
                persistanceController.saveCategory(amount: holiday, color: "pink", name: category.stringValue, icon: "suitcase.rolling")
            case .Loans:
                persistanceController.saveCategory(amount: loans, color: "black", name: category.stringValue, icon: "creditcard")
            case .Shopping:
                persistanceController.saveCategory(amount: shopping, color: "grey", name: category.stringValue, icon: "bag")
            case .Subscriptions:
                persistanceController.saveCategory(amount: subscriptions, color: "yellow", name: category.stringValue, icon: "clock.arrow.2.circlepath")
            case .Transport:
                persistanceController.saveCategory(amount: transport, color: "purple", name: category.stringValue, icon: "car")
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
    
    func fetchRecentExpenses() {
        expensesShortlist = persistanceController.fetchExpenses()
        expensesShortlist = Array(expensesShortlist.suffix(5))
    }
}
