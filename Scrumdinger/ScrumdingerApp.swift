//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by İbrahim Bayram on 5.01.2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var scrumStore = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrumStore.scrums) {
                Task {
                    do {
                        try await scrumStore.save(scrums: scrumStore.scrums)
                    }catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later")
                    }
                }
            }
            .task {
                do {
                    try await scrumStore.load()
                }catch {
                    fatalError()
                }
            }
            .sheet(item: $errorWrapper) {
                scrumStore.scrums = DailyScrum.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
