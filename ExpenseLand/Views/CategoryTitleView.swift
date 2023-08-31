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
    var categoryExpensesTotal: Double
    
    var body: some View {
        ZStack {
//            Color(categoryColor)
            Rectangle()
                .foregroundColor(.customLightPurple)
                .opacity(0.4)
            HStack {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(height: 60)
                        .scaledToFit()
                    Image(systemName: categoryIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .shadow(radius: 5)
                } //zstack
                .frame(alignment: .center)
           
                .padding()
                
                Spacer()
                VStack (spacing: 15) {
                    Text(categoryTitle.capitalized)
                        .font(.custom(Constants.Fonts.bold, size: 25))
                        .scaledToFill()
                        .shadow(radius: 0.3)
                    HStack {
                        Text(Double(categoryExpensesTotal) as NSNumber, formatter: NumberFormatter.percent)
                            .font(.custom(Constants.Fonts.extraBold, size: 16))
                            Text(Constants.Titles.budget)
                            Text(Constants.Titles.used)
                            Text(Constants.Titles.thisMonth)
                    }
                    .font(.custom(Constants.Fonts.light, size: 13))
                    .scaledToFill()
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
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .padding([.leading, .trailing])
        } //zstack
    }

struct CategoryTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTitleView(categoryTitle: "Bills", categoryColor: "red", categoryIcon: "house.fill", categoryExpensesTotal: 10)
            .previewLayout(.sizeThatFits)
    }
}
