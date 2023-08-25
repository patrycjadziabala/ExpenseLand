//
//  MainView.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State var isPresented: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
               
                Text(viewModel.totalExpenses)
                Text("Out of")
                Text(viewModel.totalBudget)
                Text("TotalBudget")
                CategoriesCardView()
                RecentExpensesView()
                
            }
        } // ScrollView
        .overlay (alignment: .bottomTrailing) {
            Button {
                isPresented.toggle()
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
            } //button
            .padding()
            .sheet(isPresented: $isPresented) {
                AddExpenseView()
            }
        }

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
