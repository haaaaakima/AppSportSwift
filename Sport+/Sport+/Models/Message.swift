import Foundation
import SwiftData

@Model
class Message : Identifiable {
    var id : UUID = UUID()
    var senderID: Int
    var senderName: String
    var receiverID: Int?
    var content: String
    var groupID : Int?
    var timestamp: Date
    var isGroup : Bool {
       return groupID != nil
    }
    
    // Initialiseur sans redéfinir `id`
    init(senderID: Int, senderName: String, receiverID: Int?, content: String, groupID: Int?, timestamp: Date) {
//        self.id = id
        self.senderID = senderID
        self.senderName = senderName
        self.receiverID = receiverID
        self.content = content
        self.groupID = groupID
        self.timestamp = timestamp
    }
    
}
