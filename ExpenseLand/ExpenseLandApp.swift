//
//  ExpenseLandApp.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import SwiftUI

@main
struct ExpenseLandApp: App {
//    let persistenceController = PersistenceController.shared

   @ObservedObject var viewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)

//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
