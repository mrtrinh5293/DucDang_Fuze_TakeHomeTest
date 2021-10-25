//
//  DucDang_Fuze_TakeHomeTestApp.swift
//  DucDang_Fuze_TakeHomeTest
//
//  Created by duc on 2021-10-24.
//

import SwiftUI

@main
struct DucDang_Fuze_TakeHomeTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
