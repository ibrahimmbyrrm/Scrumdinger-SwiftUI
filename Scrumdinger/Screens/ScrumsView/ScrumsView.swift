//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by İbrahim Bayram on 5.01.2024.
//

import SwiftUI

struct ScrumsView: View {
    @Environment(\.scenePhase) private var scenePhase
    @Binding var scrums : [DailyScrum]
    @State var isPresentingNewScrumView = false
    let saveAction : () -> Void
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
                
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }, label: {
                    Image(systemName: "plus")
                })
                .accessibilityLabel("New Scrum")
            }
            .sheet(isPresented: $isPresentingNewScrumView, content: {
                NewScrumSheet(isPresentingNewScrumView: $isPresentingNewScrumView, scrums: $scrums)
            })
            .onChange(of: scenePhase) { oldValue, newValue in
                if newValue == .inactive {
                    saveAction()
                }
            }
        }
        
    }
}


