import Foundation
import SwiftData

@Model
class GroupConversation {
    var id: Int
    var name: String
    var members: [Person]
    var messages: [Message]
    var activity: Activity?

    init(id : Int, name: String, members: [Person] = [], messages: [Message] = [], activity: Activity? = nil) {
        self.id = id
        self.name = name
        self.members = members
        self.messages = messages
        self.activity = activity
    }
}
