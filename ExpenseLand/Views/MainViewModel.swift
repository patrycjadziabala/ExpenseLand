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
    @Published var allExpenses: [Expense] = []
    @Published var expensesShortlist: [Expense] = []
    @Published var totalBudget: String = ""
    @Published var totalExpenses: String = ""
    @Published var categoryCards: [Category] = []
    
    
    init() {
       shouldPresentWelcomeScreen = shouldPresentWelcomeView()
        fetchRecentExpenses()
        fetchTotalBudgetAndTotalExpenses()
        createCategoryCardArray()
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
                persistanceController.saveCategory(amount: groceries, color: category.color, name: category.stringValue, icon: category.icon)
            case .Bills:
                persistanceController.saveCategory(amount: bills, color: category.color, name: category.stringValue, icon: category.icon)
            case .Health:
                persistanceController.saveCategory(amount: health, color: category.color, name: category.stringValue, icon: category.icon)
            case .Holiday:
                persistanceController.saveCategory(amount: holiday, color: category.color, name: category.stringValue, icon: category.icon)
            case .Loans:
                persistanceController.saveCategory(amount: loans, color: category.color, name: category.stringValue, icon: category.icon)
            case .Shopping:
                persistanceController.saveCategory(amount: shopping, color: category.color, name: category.stringValue, icon: category.icon)
            case .Subscriptions:
                persistanceController.saveCategory(amount: subscriptions, color: category.color, name: category.stringValue, icon: category.icon)
            case .Transport:
                persistanceController.saveCategory(amount: transport, color: category.color, name: category.stringValue, icon: category.icon)
            }
        }
        
        UserDefaults.standard.set(true, forKey: "BaseCategoriesAlreadySaved")
        
        shouldPresentWelcomeScreen = false
        
        let totalBudget = groceries + bills + health + holiday + loans + shopping + subscriptions + transport
        
        UserDefaults.standard.set(totalBudget, forKey: "totalBudget")
    }

    func shouldPresentWelcomeView() -> Bool {
        if UserDefaults.standard.object(forKey: "BaseCategoriesAlreadySaved") == nil {
         return true
        } else {
            return false
        }
    }
    
    func fetchRecentExpenses() {
        allExpenses = persistanceController.fetchExpenses()
        expensesShortlist = Array(allExpenses.suffix(5))
    }
    
    func fetchTotalBudgetAndTotalExpenses() {
        totalBudget = String(UserDefaults.standard.double(forKey: "totalBudget"))
        var expenses: Double = 0
        for expense in allExpenses {
            expenses += expense.expenseAmount
        }
        totalExpenses = String(expenses)
    }
    
    func createCategoryCardArray() {
        for category in CategoryName.allCases {
            let categoryCard = Category(id: UUID(), categoryName: category.stringValue, categoryAmount: 0, categoryIcon: category.icon, categoryColor: category.color, categoryExpense: filterExpenses(for: category.stringValue))
            categoryCards.append(categoryCard)
        }
    }
    
    func filterExpenses(for category: String) -> [Expense] {
        var categoryExpenses: [Expense] = []
        for expense in allExpenses {
            if expense.expenseCategory == category {
                categoryExpenses.append(expense)
            }
        }
        return categoryExpenses
        // refactor:
//        categoryExpenses = allExpenses.filter { expense in
//            expense.expenseCategory == category
//        }
        
    }
}
