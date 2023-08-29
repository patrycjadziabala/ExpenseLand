//
//  CategoriesCardView.swift
//  ExpenseLand
//
//  Created by Patka on 25/08/2023.
//

import SwiftUI

struct CategoriesCardView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State private var categoryPresented: Category?
    
    var body: some View {
        VStack {
            TabView {
                ForEach(viewModel.categoryCards, id: \.self) {
                    category in
                    ZStack {
                        Rectangle()
                            .foregroundColor(.customLightYellow)
                            .opacity(0.3)
                        VStack (spacing: 15) {
                            CategoryTitleView(categoryTitle: category.categoryName, categoryColor: Constants.Colors.customLightPink, categoryIcon: category.categoryIcon, categoryExpensesTotal: String(category.categoryExpenseTotalAmount))
                            //
                            ProgressView(value: category.categoryExpenseTotalAmount, total: category.categoryAmount)
                                .padding(.horizontal)
                                .progressViewStyle(CustomProgressViewStyle(color:  Constants.Colors.customFadedGreen, colorString: Constants.Colors.customRed))
                            HStack {
                                Text(Constants.Titles.spent)
                                Text(String(category.categoryExpenseTotalAmount))
                                Text(Constants.Titles.outOf)
                                Text(String(category.categoryAmount))
                                Text(Constants.Titles.budget)
                            } //hstack
                            Text(String(category.categoryExpensesPercentage))
                        } // vstack
                    } //zstack
                    .padding()
                } //foreach
                .sheet(item: $categoryPresented) { category in
                    Text(category.categoryName)
                }
            } //tabview
            .tabViewStyle(.page)
            .frame(height: 300)
            .padding()
        }
    }
}

struct CategoriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCardView()
    }
}
