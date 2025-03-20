import SwiftUI
import SwiftData

struct MessageDetailView: View {
    @ObservedObject var viewModel: MessageViewModel
    var receiverID: Int?  // ID du destinataire pour les messages privés
    var groupID: Int?     // ID du groupe pour les messages de groupe
    
    // Pour revenir en arrière
    @Environment(\.presentationMode) var presentationMode
    // Détection du mode sombre
    var backColor: Color = Color("PurpleBackground")

    var body: some View {
        ZStack {
            backColor
                .ignoresSafeArea()

            VStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack(spacing: 10) {
                            // Utiliser les messages de groupe ou privés selon le contexte
                            let messages = groupID != nil ? viewModel.groupMessages.flatMap { $0.messages } : viewModel.directMessages

                            ForEach(messages.indices, id: \.self) { index in
                                let message = messages[index]
                                MessageBubbleView(message: message, isCurrentUser: message.senderID == viewModel.currentUserID)
                                    .id(index)
                            }
                        }
                        .padding()
                    }
                    .onChange(of: viewModel.directMessages.count) { _ in
                        if let lastMessageIndex = viewModel.directMessages.indices.last {
                            withAnimation {
                                proxy.scrollTo(lastMessageIndex, anchor: .bottom)
                            }
                        }
                    }
                    .onChange(of: viewModel.groupMessages.flatMap { $0.messages }.count) { _ in
                        if let lastMessageIndex = viewModel.groupMessages.flatMap({ $0.messages }).indices.last {
                            withAnimation {
                                proxy.scrollTo(lastMessageIndex, anchor: .bottom)
                            }
                        }
                    }
                }

                // Barre de saisie
                HStack {
                    TextField("Votre message...", text: $viewModel.newMessageText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 10)
                    
                    Button(action: {
                        guard let senderID = viewModel.currentUserID else { return }

                        // Envoi d'un message
                        if let receiverID = receiverID {
                            // Message privé
                            viewModel.sendMessage(
                                content: viewModel.newMessageText,
                                receiverID: receiverID,
                                isGroup: false,
                                senderID: senderID,
                                senderName: viewModel.currentUserName ?? "Anonyme",
                                timestamp: Date()
                            )
                        } else if let groupID = groupID {
                            // Message de groupe
                            viewModel.sendMessage(
                                content: viewModel.newMessageText,
                                receiverID: nil,
                                isGroup: true,
                                senderID: senderID,
                                senderName: viewModel.currentUserName ?? "Anonyme",
                                timestamp: Date(),
                                groupID: groupID
                            )
                        }
                        
                        viewModel.newMessageText = "" // Réinitialiser le champ de saisie après l'envoi
                    }) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(Color("Vert"))
                            .padding()
                    }
                    .disabled(viewModel.newMessageText.isEmpty)
                }
                .padding()
            }
            
            .navigationBarBackButtonHidden(true) // Cacher le bouton retour par défaut
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    // Bouton retour en arrière customisé
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("Vert"))
                            .font(.title2)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
