//
//  ExpenseLandApp.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import SwiftUI

@main
struct ExpenseLandApp: App {

   @ObservedObject var viewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.shouldPresentWelcomeScreen == true {
                WelcomeView()
                    .environmentObject(viewModel)
            } else {
                MainView()
                    .environmentObject(viewModel)
            }
        }
    }
}
