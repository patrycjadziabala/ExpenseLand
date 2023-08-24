//
//  RecentExpensesView.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import SwiftUI

struct RecentExpensesView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        
        ForEach(viewModel.expensesShortlist, id: \.id) {
            expense in
            ExpenseRowView(expenseDescription: expense.expenseDescription, expenseCategory: expense.expenseCategory, expenseDate: expense.expenseDate, amount: expense.expenseAmount)
        }
    }
}

struct RecentExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        RecentExpensesView()
    }
}
