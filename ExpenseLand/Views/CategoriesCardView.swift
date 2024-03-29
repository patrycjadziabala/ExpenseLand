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
                        CategoryTitleView(categoryTitle: category.categoryName, categoryColor: category.categoryColor, categoryIcon: category.categoryIcon, categoryExpensesTotal: category.categoryExpensesPercentage)
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color(category.categoryColor))
                                .opacity(0.15)
                            VStack (spacing: 5) {
                                Spacer()
                                ProgressView(value: category.categoryExpenseTotalAmount, total: category.categoryAmount)
                                    .progressViewStyle(CustomProgressViewStyle(colorString: category.categoryColor))
                                    .padding()
                                HStack {
                                    Text(Constants.Titles.spent)
                                    Text(category.categoryExpenseTotalAmount , format: .currency(code: "GBP"))
                                    Text(Constants.Titles.outOf)
                                    Text(category.categoryAmount, format: .currency(code: "GBP"))
                                    Text(Constants.Titles.budget)
                                    .scaledToFit()
                                } //hstack
                                Spacer(minLength: 60)
                            } // vstack
                        } //zstack
                        .padding()
                    } //vstack
                } //foreach
                .sheet(item: $categoryPresented) { category in
                    Text(category.categoryName)
                }
            } //tabview
            .tabViewStyle(.page)
            .frame(height: 300)
            .padding([.leading, .trailing])
        } //vstack
        .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
    }
}

struct CategoriesCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesCardView()
            .previewLayout(.sizeThatFits)
    }
}
