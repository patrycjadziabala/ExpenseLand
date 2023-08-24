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
        VStack {
            AddExpenseView()
            Text("1,500")
            Text("Out of")
            Text("6,000")
            Text("budget")
        }
    }
}


// dodac kategorie basowe
// wyswietlac expensy
// gorny widok na main ktory ma sumowac budget amounts i expensy

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
