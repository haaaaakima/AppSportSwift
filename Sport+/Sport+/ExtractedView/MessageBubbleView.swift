import Foundation
import SwiftUI

struct MessageBubbleView: View {
    let message: Message
    let isCurrentUser: Bool
    
    var backColor: Color = Color("PurpleBackground")
//    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
                backColor
                    .ignoresSafeArea()
//            if colorScheme == .dark {
//                backColor.ignoresSafeArea()
//            }
            HStack {
                if isCurrentUser { Spacer() } // Décale les messages reçus à gauche
                
                Text(message.content)
                    .padding()
                    .background(isCurrentUser ? Color("Vert").opacity(0.9) : Color.gray.opacity(0.9))
                    .foregroundColor(.black)
                    .cornerRadius(16)
                    .frame(maxWidth: 250, alignment: isCurrentUser ? .trailing : .leading)
                
                if !isCurrentUser { Spacer() } // Décale les messages envoyés à droite
            }
            .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
        }
    }
}

//#Preview {
//    MessageBubbleView( message:  Message(senderID: personsDataBase[0].id, senderName: personsDataBase[0].name, receiverID: personsDataBase[2], content: "Salut, comment ça va?", groupID: nil, timestamp: Date().addingTimeInterval(-3600)), isCurrentUser: false)
//}

