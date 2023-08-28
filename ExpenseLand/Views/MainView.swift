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
                HeaderForMainView()
                CategoriesCardView()
                RecentExpensesView()
            } //vstack
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
