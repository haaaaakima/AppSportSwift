import SwiftUI
import SwiftData

struct MessageRow: View {
    let message: Message
    let timeAgo: String
    let senderName: String
    let receiverName: String
//    var direct: Message
    


    var body: some View {
        HStack(spacing: 12) {
            // Avatar - Initial destinataire
            Circle()
                .fill(Color("PurpleContent").opacity(0.5))
                .frame(width: 50, height: 50)
                .overlay(
                    Text(String(receiverName.prefix(1).uppercased()))
                        .font(.headline)
                        .foregroundColor(Color("Vert"))
                )

            // Nom detinataire
            VStack(alignment: .leading, spacing: 4) {
                Text(String(receiverName))
                .font(.headline)
                    .foregroundColor(.white)

                // Contenu du message
                Text(message.content)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }

            Spacer()

            // Horodatage
            Text(timeAgo)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal, 10)
        }
        .padding(.vertical, 8)
    }
}

