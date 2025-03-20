import SwiftUI
import SwiftData

struct NewMessageView: View {
    @ObservedObject var viewModel: MessageViewModel
    
    @Binding var receiverName: String
    @Binding var isPresented: Bool
    
    let messageType: MessageType
    
    @State private var messageText = ""
    @State private var selectedReceiver: String? = nil // Nom du destinataire pour les amis
    @State private var groupReceiver: GroupConversation? = nil  // Groupe sélectionné pour les groupes
    
    @State private var messageSent = false // Flag pour suivre l'envoi du message
//    @State private var activity: Activity? // Le groupe ou activité pour rediriger vers MessageDetailView
    
    // Fonction pour vérifier si le bouton "Envoyer" doit être activé
    private var isSendButtonEnabled: Bool {
        return !messageText.isEmpty && (
            (messageType == .amis && selectedReceiver != nil) ||
            (messageType == .groupes && groupReceiver != nil)
        )
    }
    
    private func sendMessage() {
        // Vérification que l'ID de l'expéditeur est valide
            guard let senderID = viewModel.currentUserID,
                  let senderName = viewModel.currentUserName else {
        // Si senderID ou senderName sont nil, retourner ou gérer cette erreur
                return
            }
        // Création de la timestamp actuelle
        let timestamp = Date()

        if messageType == .amis, let receiverName = selectedReceiver,
           let receiver = viewModel.contacts.first(where: { $0.name == receiverName }) {
            // Assurer que receiverID est valide
           let receiverID = receiver.id

            // Envoi du message
            viewModel.sendMessage(
                content: messageText,
                receiverID: receiverID,
                isGroup: false,
                senderID: senderID,
                senderName: senderName,
                timestamp: timestamp
            )
            isPresented = false
            messageSent = true
        } else if messageType == .groupes,
            let groupReceiver = groupReceiver {
            // Envoi du message pour un groupe
            viewModel.sendMessage(
                content: messageText,
                receiverID: nil,
                isGroup: true,
                senderID: senderID,
                senderName: senderName,
                timestamp: timestamp
            )
            isPresented = false
            messageSent = true
        }
    }
    
    var backColor: Color = Color("PurpleBackground")
//    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        NavigationView {
            ZStack {
                backColor
                    .ignoresSafeArea()
//                if colorScheme == .dark {
//                    backColor.ignoresSafeArea()
//                }
                VStack {
                    if messageType == .groupes {
//                        Text("Message de groupe")
//                            .font(.headline)
//                            .padding(.top, 10)
                        
                        // Sélection du groupe parmi les GroupConversations
                        Picker("Choisir un groupe", selection: $groupReceiver) {
                            Text("Sélectionner...").tag(nil as GroupConversation?)
                            ForEach(viewModel.groupMessages, id: \.id) { group in
                                Text(group.name).tag(group as GroupConversation?)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .accentColor(Color("Vert"))
                        
                    } else {
                        // Sélection du destinataire par nom pour les amis
                        Picker("Choisir un destinataire", selection: $selectedReceiver) {
                            Text("Sélectionner...").tag(nil as String?)
                            ForEach(viewModel.contacts, id: \.name) { person in
                                Text(person.name).tag(person.name as String?)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .accentColor(Color("Vert"))
                    }
                    
                    TextField("Votre message", text: $messageText, axis: .vertical)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Spacer()
                }
                .navigationTitle("Nouveau message")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Annuler") {
                            isPresented = false
                        }
                        .foregroundColor(Color("Vert"))
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Envoyer") {
                            sendMessage() // Appel à la fonction d'envoi
                        }
                        .disabled(!isSendButtonEnabled) // Désactiver si conditions non remplies
                        .foregroundColor(isSendButtonEnabled ? Color("Vert") : .gray)
                    }
                }
            }
//            .preferredColorScheme(.dark) // Mode sombre par défaut

        }
    }
}

