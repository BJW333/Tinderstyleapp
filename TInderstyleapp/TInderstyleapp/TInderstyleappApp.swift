//
//  TInderstyleappApp.swift
//  TInderstyleapp
//
//  Created by Blake Weiss on 2/5/24.
//

import SwiftUI

@main
struct TInderstyleappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
