import Foundation
import SwiftData
import SwiftUI

@MainActor
class MessageViewModel: ObservableObject {

    @Published var modelContext: ModelContext
    @Published var contacts: [Person] = [] // Liste d'amis en dur
//    @Published var contacts: [Person] = personnesDataBase.filter { $0.level == .intermediaire }
    @Published var groupMessages: [GroupConversation] = [] // Messages de groupe
    @Published var directMessages: [Message] = [] // Messages privés
    @Published var activity: [Activity] = []
    @Published var personnes: [Person] = personsDataBase
    @Published var selectedConversation: Message?
    @Published var currentUserID: Int? // Simule un utilisateur actuel
    @Published var currentUserName: String? = ""
    @Published var newMessageText: String = ""

    init(currentUserID: Int?, modelContext: ModelContext) {
        self.currentUserID = currentUserID
        self.modelContext = modelContext
        
        self.loadMessages()
        self.loadContacts()
    }
    
    func loadContacts() {
            // Assurez-vous que personnesDataBase contient des contacts différents et correctement chargés
            self.personnes = personsDataBase
            // Si vous avez besoin de filtrer ou trier, vous pouvez ajouter ici des logiques supplémentaires
            self.contacts = personsDataBase.filter { $0.level == .intermediaire } // Exemple de filtre
            print("✅ Contacts chargés : \(self.contacts.count)")
            for contact in contacts {
                print("👤 Contact: \(contact.name)")
            }
        }

    func loadMessages() {
        // Charge les messages depuis la base de données
        let (loadedGroupMessages, loadedDirectMessages) = MessageDatabase.load(myID: currentUserID ?? 0)

        // Assigne les messages aux propriétés
        self.groupMessages = loadedGroupMessages
        self.directMessages = loadedDirectMessages

        print("✅ Messages chargés : \(loadedDirectMessages.count) messages directs, \(loadedGroupMessages.count) messages de groupe")
    }

    // Envoi d'un message
    func sendMessage(
        content: String,
        receiverID: Int?,
        isGroup: Bool,
        senderID: Int,
        senderName: String,
        timestamp: Date,
        groupID: Int? = nil // Ajoutez groupID pour les messages de groupe
    ) {
        let newMessage = Message(
            senderID: senderID,
            senderName: senderName,
            receiverID: receiverID,
            content: content,
            groupID: groupID, // Utilisez groupID pour les messages de groupe
            timestamp: timestamp
        )

        if isGroup {
            // Ajouter le message au groupe correspondant
            if let groupIndex = groupMessages.firstIndex(where: { $0.id == groupID }) {
                groupMessages[groupIndex].messages.append(newMessage)
            }
        } else {
            // Ajouter le message aux messages directs
            directMessages.append(newMessage)
        }

        // Sauvegarder les messages
        MessageDatabase.save(groupMessages.flatMap { $0.messages } + directMessages)
    }

    func filteredMessages(isGroup: Bool) -> [Message] {
        if isGroup {
            // Retourner les messages de groupe
            return groupMessages.flatMap { $0.messages }
        } else {
            // Retourner les messages directs
            return directMessages
        }
    }

    func getPersonByID(_ id: Int) -> Person? {
        return personnes.first { $0.id == id }
    }

    // Obtenir le nom de l'expéditeur
    func getSenderName(for message: Message) -> String {
        return getPersonByID(message.senderID)?.name ?? "Utilisateur inconnu"
    }

    // Obtenir le nom du destinataire
    func getReceiverName(for message: Message) -> String {
        guard let receiverID = message.receiverID else { return "Groupe" }
        return getPersonByID(receiverID)?.name ?? "Utilisateur inconnu"
    }

    // Obtenir le temps écoulé
    func timeAgo(date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}
