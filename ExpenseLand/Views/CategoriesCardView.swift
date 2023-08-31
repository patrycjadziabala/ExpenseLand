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
                    VStack {
                        CategoryTitleView(categoryTitle: category.categoryName, categoryColor: Constants.Colors.customLightPink, categoryIcon: category.categoryIcon, categoryExpensesTotal: category.categoryExpenseTotalAmount)
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.customRed)
                                .opacity(0.3)
                            VStack (spacing: 15) {
                                
                                
                                ProgressView(value: category.categoryExpenseTotalAmount, total: category.categoryAmount)
                                    .padding(.horizontal)
                                    .progressViewStyle(CustomProgressViewStyle(color:  Constants.Colors.customFadedGreen, colorString: Constants.Colors.customLightGreen))
                                HStack {
                                    Text(Constants.Titles.spent)
                                    Text(category.categoryExpenseTotalAmount as NSNumber, formatter: NumberFormatter.currency)
                                    Text(Constants.Titles.outOf)
                                    Text(category.categoryAmount as NSNumber, formatter: NumberFormatter.currency)
                                    Text(Constants.Titles.budget)
                                } //hstack
                                
                            } // vstack
                        } //zstack
                        .padding()
                    }
                } //foreach
                .sheet(item: $categoryPresented) { category in
                    Text(category.categoryName)
                }
            } //tabview
            .tabViewStyle(.page)
            .frame(height: 300)
            .padding()
        }
        .padding()
        .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
    }
}

struct CategoriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCardView()
            .previewLayout(.sizeThatFits)
    }
}
