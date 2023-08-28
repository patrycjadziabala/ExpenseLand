//
//  CategoryTitleView.swift
//  ExpenseLand
//
//  Created by Patka on 28/08/2023.
//

import SwiftUI

struct CategoryTitleView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State private var categoryPresented: Category?
    
    var body: some View {
        ZStack {
            Color(categoryPresented?.categoryColor ?? "red")
                .opacity(0.4)
            HStack {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(height: 60)
                    Image(systemName: categoryPresented?.categoryIcon ?? "home.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .shadow(radius: 5)
                } //zstack
                .frame(alignment: .center)
                .padding()
                Spacer()
                VStack {
                    Text(categoryPresented?.categoryName ?? "Default")
                        .font(.custom(Constants.Fonts.bold, size: 30))
                        .shadow(radius: 0.3)
                    HStack {
                        Text(viewModel.$totalBudget)
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
        CategoryTitleView()
    }
}
