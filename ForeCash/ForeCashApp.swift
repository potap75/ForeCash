//
//  ForeCashApp.swift
//  ForeCash
//
//  Created by Roman Potapov on 7/29/24.
//

import SwiftUI
import SwiftData

@main
struct ForeCashApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Transaction.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TransactionsScreen()
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
