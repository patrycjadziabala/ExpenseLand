//
//  CategoryTitleView.swift
//  ExpenseLand
//
//  Created by Patka on 28/08/2023.
//

import SwiftUI

struct CategoryTitleView: View {
  
    var categoryTitle: String
    var categoryColor: String
    var categoryIcon: String
    var categoryBudget: String
    
    var body: some View {
        ZStack {
            Color(categoryColor)
                .opacity(0.4)
            HStack {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(height: 60)
                    Image(systemName: categoryIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .shadow(radius: 5)
                } //zstack
                .frame(alignment: .center)
                .padding()
                Spacer()
                VStack {
                    Text(categoryTitle)
                        .font(.custom(Constants.Fonts.bold, size: 30))
                        .shadow(radius: 0.3)
                    HStack {
                        Text(categoryBudget)
                            .font(.custom(Constants.Fonts.extraBold, size: 16))
                        Text("Spent this month")
                            .font(.custom(Constants.Fonts.regular, size: 16))
                    }
                    .foregroundColor(.black)
                    .shadow(radius: 2)
                } //vstack
                Spacer()
                VStack {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 28)
                        .padding()
                   Spacer()
                }// vstack
                .frame(alignment: .top)
            } // hstack
        }
        .frame(height: 100)
        } //zstack
    }

struct CategoryTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTitleView(categoryTitle: "Bills", categoryColor: "red", categoryIcon: "home.fill", categoryBudget: "500")
    }
}
