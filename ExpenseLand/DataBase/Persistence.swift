//
//  Persistence.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ExpenseLand")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
// MARK: - Save
extension PersistenceController {
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving to database \(error.localizedDescription)")
        }
    }
    
    func saveExpense(description: String, amount: Double, date: Date, category: String) {
        let expense = DBExpense(context: viewContext)
        expense.id = UUID()
        expense.expenseAmount = amount
        expense.expenseCategory = category
        expense.expenseDate = date
        expense.expenseDescription = description
        
        save()
    }
    
    func saveCategory(amount: Double, color: String, name: String, icon: String) {
        let category = DBCategory(context: viewContext)
        category.id = UUID()
        category.categoryAmount = amount
        category.categoryName = name
        category.categoryIcon = icon
        category.categoryColor = color
        
        save()
    }
    
    func saveCategoryAmount(category: String, amount: Double) {
        guard let category = fetchCategory(categoryName: category).first else {
            return
        }
        category.categoryAmount = amount
        save()
    }
}

// MARK: - Fetch data

extension PersistenceController {
    
    func fetchExpenses() -> [Expense] {
        let request = NSFetchRequest<DBExpense>(entityName: "DBExpense")
        var expenses = [Expense]()
        do {
            let expense = try viewContext.fetch(request)
            for e in expense {
                let icon = CategoryName(rawValue: e.expenseCategory?.capitalized ?? "")?.icon ?? ""
                let expense = Expense(id: e.id ?? UUID(), expenseAmount: e.expenseAmount, expenseDate: e.expenseDate ?? Date(), expenseDescription: e.expenseDescription ?? "", expenseCategory: e.expenseCategory ?? "", expenseIcon: icon)
                expenses.append(expense)
            }
        } catch {
            print("Error fetching expenses \(error.localizedDescription)")
        }
        return expenses
    }
    
    func fetchCategory(categoryName: String) -> [DBCategory] {
        let request = NSFetchRequest<DBCategory>(entityName: "DBCategory")
        request.predicate = NSPredicate(format: "name LIKE %@", categoryName)
        
        do {
            let category = try viewContext.fetch(request)
            return category
        } catch {
            print("Error fetching Base Category \(error.localizedDescription)")
        }
        return []
    }
    
    func fetchAllCategories() -> [DBCategory] {
        let request = NSFetchRequest<DBCategory>(entityName: "DBCategory")
        do {
            let categories = try viewContext.fetch(request)
            return categories
        } catch {
            print("Error fetching Base Categories \(error.localizedDescription)")
        }
        return []
    }
}

//MARK: - Delete

extension PersistenceController {
    func removeExpenseFromDatabase() {
        fetchExpenses()
        
    }
}


