//
//  ExpenseRowView.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import SwiftUI

struct ExpenseRowView: View {
    
    let expenseDescription: String
    let expenseCategory: String
    let expenseDate: Date
    let amount: Double
    let icon: String
    let color: String
    
    var body: some View {
     
            HStack (spacing: 20) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color(color))
//                        .fill(Color.cyan.opacity(0.6))
                        .frame(width: 40, height: 40)
                    Image(systemName: icon)
                } //zstack
                VStack(alignment: .leading, spacing: 6) {
                    Text(expenseDescription)
                        .lineLimit(1)
                    Text(expenseCategory)
                        .opacity(0.7)
                        .lineLimit(1)
                    Text(expenseDate.toString())
                        .opacity(0.7)
                } //vstack
                Spacer()
                Text(amount, format: .currency(code: "GBP"))
                    .padding()
            } //hstack
            .padding([.top, .bottom], 8)
        }
    }

struct ExpenseRowView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseRowView(expenseDescription: "Apple", expenseCategory: "Groceries", expenseDate: Date(), amount: 5, icon: "", color: "red")
    }
}
