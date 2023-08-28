//
//  AddExpenseView.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import SwiftUI

struct AddExpenseView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State var expenseAmount: Double = 0
    @State var description: String = ""
    @State var category: CategoryName = .Bills
    @State var date: Date = Date()
    
    var body: some View {
        
        VStack {
            Text("Add Expense")
            TextField(value: $expenseAmount, format: .number) {
                Text("Enter Amount")
            }
            .keyboardType(.decimalPad)
            .padding()
            TextField("description", text: $description)
            Picker("Category Picker", selection: $category) {
                ForEach(CategoryName.allCases, id: \.self) { name in
                    Text(name.stringValue)
                }
            } //picker
            Button {
                viewModel.saveExpense(description: description, amount: expenseAmount, date: date, category: category.stringValue)
            } label: {
                Text("Add")
            } //button
        } //vstack
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
