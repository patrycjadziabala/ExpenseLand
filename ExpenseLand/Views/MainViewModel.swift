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
    @Published var totalBudgetLeft: String = ""
    @Published var categoryBudgetPercentageUsed: Double = 0
    @Published var totalExpenseAmountForCategory: Double = 0
    @Published var totalBudgetForCategory: Double = 0
    
    init() {
        shouldPresentWelcomeScreen = shouldPresentWelcomeView()
        fetchRecentExpenses()
        fetchTotalBudgetAndTotalExpenses()
        fetchCategories()
        calculateTotalBudgetLeft()
    }
    
    func saveExpense(description: String, amount: Double, date: Date, category: String) {
        persistanceController.saveExpense(description: description, amount: amount, date: date, category: category)
        fetchRecentExpenses()
//        print(persistanceController.fetchExpenses())
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
    
    func fetchCategories() {
        let dBCategories = persistanceController.fetchAllCategories()
        for dBCategory in dBCategories {
            let expenses = filterExpenses(for: dBCategory.categoryName ?? "")
            let totalAmount = calculateTotalCategoryExpenses(expenses: expenses)
            let categoryBudgetPercentageUsed = calculateCategoryBudgetPercentageUsed(categories: categoryCards)
            let category = Category(id: UUID(), categoryName: dBCategory.categoryName ?? "", categoryAmount: dBCategory.categoryAmount, categoryIcon: dBCategory.categoryIcon ?? "home.fill", categoryColor: dBCategory.categoryColor ?? "red", categoryExpense: expenses, categoryExpenseTotalAmount: totalAmount, categoryExpensesPercentage: categoryBudgetPercentageUsed)
            categoryCards.append(category)
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
    
    func calculateTotalCategoryExpenses(expenses: [Expense]) -> Double {
        var totalExpensesAmount: Double = 0
        for expense in expenses {
            totalExpensesAmount += expense.expenseAmount
        }
        totalExpenseAmountForCategory = totalExpensesAmount
        return totalExpensesAmount
    }
    
    func calculateCategoryBudgetPercentageUsed(categories: [Category]) -> Double {
        var totalCategoryBudget: Double = 0
        for category in categories {
            totalCategoryBudget = category.categoryAmount
            let percentageUsed = totalExpenseAmountForCategory / totalCategoryBudget
            
            categoryBudgetPercentageUsed = percentageUsed
            print(category.categoryName)
                    print(totalExpenseAmountForCategory)
                    print(totalCategoryBudget)
                    print(categoryBudgetPercentageUsed)
            print("Next category")
        }

        return categoryBudgetPercentageUsed
    }
    
    func calculateTotalBudgetLeft() -> Double {
        let budgetLeft = (Double(totalBudget) ?? 0) - (Double(totalExpenses) ?? 0)
        totalBudgetLeft = String(budgetLeft)
        return Double(budgetLeft)
    }
}
