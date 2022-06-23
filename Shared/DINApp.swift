//
//  DINApp.swift
//  Shared
//
//  Created by sano on 6/22/22.
//

import SwiftUI

@main
struct DINApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
