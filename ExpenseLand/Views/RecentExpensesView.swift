//
//  RecentExpensesView.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import SwiftUI

struct RecentExpensesView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    func removeRows(at offsets: IndexSet) {
        viewModel.expensesShortlist.remove(atOffsets: offsets)
        for index in offsets {
            viewModel.deleteExpense(at: index)
        }
    }
    
    var body: some View {
        
        List {
            ForEach(viewModel.expensesShortlist, id: \.id) {
                expense in
                ExpenseRowView(expenseDescription: expense.expenseDescription, expenseCategory: expense.expenseCategory.capitalized, expenseDate: expense.expenseDate, amount: expense.expenseAmount, icon: expense.expenseIcon)
            }
            .onDelete(perform: removeRows(at:))
        }
        .frame(height: 300)
        .padding(.horizontal)
       
    }
}

struct RecentExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        RecentExpensesView()
    }
}
