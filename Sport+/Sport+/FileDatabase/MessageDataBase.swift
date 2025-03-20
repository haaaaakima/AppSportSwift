import Foundation
import SwiftData

class MessageDatabase: Identifiable {
    
    // Identifiants de groupe pour différentes activités (course et sport)
    static let groupID1 = 1  // Séance de course
    static let groupID2 = 2  // Séance de sport
    
    // Messages privés par défaut
    static var defaultDirectMessages: [Message] = [
        Message(senderID: personsDataBase[1].id, senderName: personsDataBase[1].name, receiverID: personsDataBase[0].id, content: "Salut, comment ça va?", groupID: nil, timestamp: Date().addingTimeInterval(-3300))
//        Message(senderID: personsDataBase[0].id, senderName: personsDataBase[0].name, receiverID: personsDataBase[1].id, content: " Ça va bien, merci!", groupID: nil, timestamp: Date().addingTimeInterval(-3600))
    ]
    
    // Messages de groupe par défaut
    static var defaultGroupMessages: [Message] = [
        Message(senderID: personsDataBase[0].id, senderName: personsDataBase[0].name, receiverID: personsDataBase[1].id, content: "On se fait une séance demain?", groupID: groupID1, timestamp: Date().addingTimeInterval(-3000)),
        Message(senderID: personsDataBase[1].id, senderName: personsDataBase[1].name, receiverID: personsDataBase[0].id, content: "Oui, ça marche!", groupID: groupID1, timestamp: Date().addingTimeInterval(-2700)),
        Message(senderID: personsDataBase[1].id, senderName: personsDataBase[1].name, receiverID: personsDataBase[0].id, content: "Super séance hier !", groupID: groupID2, timestamp: Date().addingTimeInterval(-2400)),
        Message(senderID: personsDataBase[0].id, senderName: personsDataBase[0].name, receiverID: personsDataBase[1].id, content: "Je me sens en forme, merci ! 💪", groupID: groupID2, timestamp: Date().addingTimeInterval(-2100))
    ]
    
    // Fonction pour charger les messages liés à un utilisateur donné
    static func load(myID: Int) -> ([GroupConversation], [Message]) {
        // Simulation du chargement des messages depuis une base de données ou une source de données
        
        let groupMessages: [GroupConversation] = [
            GroupConversation(
                id : 1,
                name: "Course", // Nom du groupe de discussion
                messages: defaultGroupMessages.filter { $0.groupID == groupID1 }, // Filtrer les messages du groupe
                activity: Activity(
                    name: "Course",
                    sportType: .course,
                    date: Date(),
                    numberOfParticipant: 1,
                    personsRecordedIDs: [myID],
                    authorID: myID,
                    cityActivity: "Paris",
                    activityDescription: "Séance de running",
                    messageGroupID: groupID1
                )
            )
        ]
        
        let directMessages: [Message] = defaultDirectMessages // Utiliser les messages privés par défaut
        
        return (groupMessages, directMessages)
    }
    
    // Fonction pour sauvegarder les messages (à implémenter si nécessaire)
    static func save(_ messages: [Message]) {
        // Implémenter la logique de sauvegarde (ex: base de données, fichier JSON, etc.)
    }
}
