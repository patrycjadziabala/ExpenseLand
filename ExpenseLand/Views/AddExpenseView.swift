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
    @State var category: String = ""
    @State var date: Date = Date()
    
    var body: some View {
        
        VStack {
            Text("Add Expense")
            TextField(value: $expenseAmount, format: .number) {
                Text("Enter Amount")
            }
            .keyboardType(.decimalPad)
            .padding()
            TextField("", text: $description)
            Picker("", selection: $category) {
                ForEach(CategoryName.allCases, id: \.self) { name in
                    Text(name.stringValue)
                }
            }
            Button {
                viewModel.saveExpense(description: description, amount: expenseAmount, date: date, category: category)
            } label: {
                Text("Add")
            }

        }
    }
    
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
