//
//  WelcomeView.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    @State private var userName: String = ""
    @State private var groceriesBudget: Double = 0
    @State private var billsBudget: Double = 0
    @State private var healthBudget: Double = 0
    @State private var holidayBudget: Double = 0
    @State private var loansBudget: Double = 0
    @State private var shoppingBudget: Double = 0
    @State private var subscriptionsBudget: Double = 0
    @State private var transportBudget: Double = 0
    
    var body: some View {
        VStack {
            Text("Hello!")
            TextField(text: $userName) {
                Text("Enter your name")
            }
            .padding()
            Text("Enter your budgets")
            VStack {
                HStack {
                    Text("Groceries")
                    Spacer()
                    TextField(value: $groceriesBudget, format: .number) {
                        Text("Enter amount")
                    }
                    .keyboardType(.numberPad)
                } //hstack
                .padding()
                HStack {
                    Text("Bills")
                    Spacer()
                    TextField(value: $billsBudget, format: .number) {
                        Text("Enter amount")
                    }
                    .keyboardType(.numberPad)
                } //hstack
                .padding()
                HStack {
                    Text("Health")
                    Spacer()
                    TextField(value: $healthBudget, format: .number) {
                        Text("Enter amount")
                    }
                    .keyboardType(.numberPad)
                } //hstack
                .padding()
                HStack {
                    Text("Holiday")
                    Spacer()
                    TextField(value: $holidayBudget, format: .number) {
                        Text("Enter amount")
                    }
                    .keyboardType(.numberPad)
                } //hstack
                .padding()
                HStack {
                    Text("Loans")
                    Spacer()
                    TextField(value: $loansBudget, format: .number) {
                        Text("Enter amount")
                    }
                    .keyboardType(.numberPad)
                } //hstack
                .padding()
                HStack {
                    Text("Shopping")
                    Spacer()
                    TextField(value: $shoppingBudget, format: .number) {
                        Text("Enter amount")
                    }
                    .keyboardType(.numberPad)
                } //hstack
                .padding()
                HStack {
                    Text("Subscriptions")
                    Spacer()
                    TextField(value: $subscriptionsBudget, format: .number) {
                        Text("Enter amount")
                    }
                    .keyboardType(.numberPad)
                } //hstack
                .padding()
                HStack {
                    Text("Transport")
                    Spacer()
                    TextField(value: $transportBudget, format: .number) {
                        Text("Enter amount")
                    }
                    .keyboardType(.numberPad)
                } //hstack
                .padding()
            } //vstack
            
            Button {
                viewModel.saveBaseCategoriesOnFirstLaunch(groceries: groceriesBudget, bills: billsBudget, health: healthBudget, holiday: holidayBudget, loans: loansBudget, shopping: shoppingBudget, subscriptions: subscriptionsBudget, transport: transportBudget)
            } label: {
                Text("Save and Enter")
            } //button
        } //vstack
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
