//
//  HeaderForMainView.swift
//  ExpenseLand
//
//  Created by Patka on 28/08/2023.
//

import SwiftUI

struct HeaderForMainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State private var setBudgets: Bool = false
    
    var body: some View {
        ZStack {
            Image(Constants.Images.mainHeaderBackground)
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                VStack (spacing: 25) {
                    Text(Constants.Titles.dashboard)
                        .font(.custom(Constants.Fonts.extraBold, size: 35))
                        .foregroundColor(.white)
                        .shadow(radius: 0.6)
                    VStack (spacing: 5) {
                            Text(viewModel.totalExpenses)
                                .font(.custom(Constants.Fonts.bold, size: 45))
                                .foregroundColor(.white)
                                .opacity(0.7)
                                .shadow(radius: 0.5)
                            Text(Constants.Titles.leftThisMonth)
                                .font(.custom(Constants.Fonts.bold, size: 15))
                                .foregroundColor(.white)
                                .opacity(0.7)
            //                Text(viewModel.totalBudgetLeft)
                        HStack {
                            Text(Constants.Titles.outOf)
                            Text(viewModel.totalBudget)
                            Text(Constants.Titles.totalBudget)
                        }
                        .font(.custom(Constants.Fonts.medium, size: 25))
                        .foregroundColor(.white)
                        .opacity(0.6)
                        .shadow(radius: 0.6)
                    } //vstack
                }
                .padding()
                Button {
                    setBudgets.toggle()
                } label: {
                    Text(Constants.Titles.setBudgets)
                        .font(.custom(Constants.Fonts.bold, size: 20))
                        .foregroundColor(.white)
                        .shadow(radius: 0.6)
                        .opacity(0.7)
                        .background(
                        Capsule()
                            .strokeBorder(lineWidth: 3)
                            .padding([.top, .bottom, .leading, .trailing], -10)
                            .foregroundColor(.white)
                            .opacity(0.5)
                        )
                } //button
                .frame(alignment: .bottomTrailing)
                .sheet(isPresented: $setBudgets) {
                    CategoryBudgetsView()
                }
//                .padding()
            } //vstack
        } //zstack
    }
}

struct HeaderForMainView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderForMainView()
    }
}
