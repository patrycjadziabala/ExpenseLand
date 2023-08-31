//
//  AddExpenseView.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import SwiftUI

struct AddExpenseView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @Environment(\.dismiss) var dismiss
    @State var expenseAmount: Double = 0
    @State var description: String = ""
    @State var category: CategoryName = .Bills
    @State var date: Date = Date()
    
    var body: some View {
        
        ZStack {
            Color(Constants.Colors.customFadedGreen)
                .opacity(0.2)
                .ignoresSafeArea()
            VStack {
                Text("Add Expense")
                    .font(.custom(Constants.Fonts.bold, size: 35))
                    .padding()
                Spacer()
                VStack (alignment: .center) {
                    Text("Selected date:")
                        .font(.custom(Constants.Fonts.extraBold, size: 25))
                        .shadow(radius: 2)
                    DatePicker("Selected Date", selection: $date, displayedComponents: .date)
                        .shadow(radius: 5)
                        .labelsHidden()
                        .accentColor(Color(Constants.Colors.customLightBlue))
                        .colorInvert()
                        .colorMultiply(Color(Constants.Colors.customOrange))
                        .background(Color(Constants.Colors.customLightBlue).opacity(0.6))
                        .cornerRadius(90)
                }
                TextField(value: $expenseAmount, format: .number) {
                    Text("Enter Amount")
                }
                .keyboardType(.decimalPad)
                .background(
                    Color.white
                        .cornerRadius(20, corners: .allCorners)
                        .frame(height: 50)
                )
                .padding()
                TextField("description", text: $description)
                    .background(
                        Color.white.cornerRadius(20, corners: .allCorners)
                    )
                    .padding()
                Picker("Category Picker", selection: $category) {
                    ForEach(CategoryName.allCases, id: \.self) { name in
                        Text(name.stringValue)
                    }
                } //picker
                .pickerStyle(.wheel)
                Button {
                    viewModel.saveExpense(description: description, amount: expenseAmount, date: date, category: category.stringValue)
                    dismiss()
                } label: {
                    Text("Add")
                        .font(.custom(Constants.Fonts.bold, size: 20))
                        .foregroundColor(.white)
                        .shadow(radius: 0.6)
                        .opacity(0.7)
                        .background(
                        Capsule()
                            .strokeBorder(lineWidth: 3)
                            .padding([.top, .bottom, .leading, .trailing], -10)
                            .foregroundColor(.white)
                            .opacity(0.5)
                        )
                } //button
            }
        } //vstack
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
