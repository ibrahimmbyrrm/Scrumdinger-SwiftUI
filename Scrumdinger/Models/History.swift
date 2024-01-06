//
//  History.swift
//  Scrumdinger
//
//  Created by İbrahim Bayram on 5.01.2024.
//

import Foundation

struct History : Identifiable,Codable {
    let id : UUID
    let date : Date
    let attendees : [DailyScrum.Attendee]
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
