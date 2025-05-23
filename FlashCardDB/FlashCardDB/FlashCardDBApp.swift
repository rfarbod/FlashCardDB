//
//  FlashCardDBApp.swift
//  FlashCardDB
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import AppDomain
import SwiftUI
import SwiftData

@main
struct FlashCardDBApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            FlashCardSwiftDataModel.self,
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
            ContentView(viewModel: .init(
                model: .init(),
                repository: FlashCardDataSource(
                    swiftData: .init(context: sharedModelContainer.mainContext),
                    jsonData: .init()
                ),
                xpRepository: XPUserDefaultsRepository(userDefaults: UserDefaults.standard)
            ))
        }
        .modelContainer(sharedModelContainer)
    }
}
