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
    
    var body: some View {
        VStack {
            Text("Hello!")
            TextField(text: $userName) {
                Text("Enter your name")
            }
            .padding()
            Text("Enter your budgets")
            HStack {
                Text("Groceries")
                Spacer()
                TextField(value: $groceriesBudget, format: .number) {
                    Text("Enter amount")
                }
            }
            .padding()
            Button {
                
            } label: {
                Text("Enter")
            }

        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
