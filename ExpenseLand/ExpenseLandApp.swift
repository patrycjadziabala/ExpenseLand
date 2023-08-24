//
//  ExpenseLandApp.swift
//  ExpenseLand
//
//  Created by Patka on 24/08/2023.
//

import SwiftUI

@main
struct ExpenseLandApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
