//
//  Event.swift
//  Sport+
//
//  Created by Mouhamadou SALL on 05/03/2025.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Activity : Identifiable {
    var id : UUID = UUID()
    var name: String
    var sportType : Sport
    var date : Date
    var dateString : String {
        var dateActivity = ""
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateFormat = "dd MMMM HH:mm"
        let formattedDate = formatter.string(from: date)
        dateActivity = formattedDate
        
        return dateActivity
    }
    var personsRecordedIDs : [Int]
    var authorID : Int
    var countPersonsRecorded : Int {
        personsRecordedIDs.count
    }
    var numberOfParticipant : Int
    var cityActivity : String
    var image :ImageResource {
        sportType.imageSport
    }
    var activityDescription : String
    var messageGroupID : Int?
    
    init(name: String , sportType: Sport, date: Date, numberOfParticipant: Int, personsRecordedIDs: [Int], authorID: Int, cityActivity: String, activityDescription: String, messageGroupID : Int? = nil) {
        self.name = name
        self.sportType = sportType
        self.date = date
        self.personsRecordedIDs = personsRecordedIDs
        self.authorID = authorID
        self.cityActivity = cityActivity
        self.activityDescription = activityDescription
        self.messageGroupID = messageGroupID
        self.numberOfParticipant = numberOfParticipant
    }
}
