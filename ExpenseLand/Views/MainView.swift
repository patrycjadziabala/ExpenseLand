//
//  MainView.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                AddExpenseView()
                Text(viewModel.totalExpenses)
                Text("Out of")
                Text(viewModel.totalBudget)
                Text("TotalBudget")
                RecentExpensesView()
            }
        } // ScrollView
    }
}

// dodac kategorie basowe - done
// wyswietlac expensy
// gorny widok na main ktory ma sumowac budget amounts i expensy

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
