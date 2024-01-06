//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by İbrahim Bayram on 5.01.2024.
//

import SwiftUI

struct NewScrumSheet: View {
    @Binding var isPresentingNewScrumView : Bool
    @Binding var scrums : [DailyScrum]
    @State var newScrum = DailyScrum.emptyScrum
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button(action: {
                            isPresentingNewScrumView = false
                        }, label: {
                            Text("Dismiss")
                        })
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }, label: {
                            Text("Add")
                        })
                    }
                }
        }
    }
}
