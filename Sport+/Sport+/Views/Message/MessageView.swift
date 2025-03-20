import SwiftUI
import SwiftData

struct MessageView: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @StateObject var viewModel: MessageViewModel

    init(viewModel: MessageViewModel) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }
    
    
    @State private var messageType: MessageType = .amis
    @State private var newMessageText = ""
    @State private var showingNewMessageSheet = false

    // Filtrage des messages selon le type
    var filteredMessages: [Message] {
        viewModel.filteredMessages(isGroup: messageType == .groupes)
    }

    var backColor: Color = Color("PurpleBackground")
    @Environment(\.colorScheme) var colorScheme // Détection du mode sombre

    var body: some View {
        NavigationView {
            ZStack {
                if colorScheme == .dark {
                    backColor.ignoresSafeArea() // Applique la couleur de fond en mode sombre
                }
                VStack(spacing: 0) {
                    
                    MessageTypePicker(messageType: $messageType)
                    
                    if messageType == .groupes {
                        GroupMessagesView()
                            .environmentObject(viewModel)
                        
                    } else {
                        PrivateMessagesView()
                            .environmentObject(viewModel)

                    }
                    
                    Spacer() // Ce Spacer pousse les messages en haut
                    
                }
                .onAppear {
                    viewModel.loadContacts()
                    viewModel.loadMessages()
                    
                }
                .navigationTitle("Messages")
                  .navigationBarTitleDisplayMode(.inline)
                  .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: FriendsView()) {
                            Image(systemName: "person.2.badge.plus")
                                .foregroundColor(.white)
                                .frame(width: 24, height: 24)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { showingNewMessageSheet = true }) {
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.white)
                                .frame(width: 24, height: 24)
                        }
                    }
                }
                .sheet(isPresented: $showingNewMessageSheet) {
                    NewMessageView(viewModel: viewModel, receiverName: $newMessageText, isPresented: $showingNewMessageSheet, messageType: messageType)
                }
            }
            .preferredColorScheme(.dark) // Définir le mode sombre par défaut
        }
    }
}
