//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by İbrahim Bayram on 5.01.2024.
//

import Foundation

struct DailyScrum : Identifiable,Codable {
    let id : UUID
    var title : String
    var attendees : [Attendee]
    var history : [History] = []
    var lengthInMinutes : Int
    var lengthInMinutesAsDouble : Double {
        get {
            return Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme : Theme
    
    init(id: UUID = UUID(), title: String, attendees: [Attendee], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee : Identifiable,Codable {
        let id : UUID
        var name : String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum = DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
}

extension DailyScrum {
    static var sampleData : [DailyScrum] =
    [
        DailyScrum(title: "Design",
                   attendees: [Attendee(name:"Onur"),Attendee(name:"Hakan"),Attendee(name:"Ceylin"),Attendee(name:"Murat")],
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyScrum(title: "App Dev",
                   attendees: [Attendee(name: "Çağrı"),Attendee(name: "Ahmet"),Attendee(name: "Kerem"),Attendee(name: "Necati"),Attendee(name: "Furkan")],
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                   attendees: [Attendee(name: "Chella"), Attendee(name: "Chris"), Attendee(name: "Christina"), Attendee(name: "Eden"), Attendee(name: "Karla"), Attendee(name: "Lindsey"), Attendee(name: "Aga"), Attendee(name: "Chad"), Attendee(name: "Jenn"), Attendee(name: "Sarah")],
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]
}
