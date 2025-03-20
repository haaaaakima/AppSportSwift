import SwiftUI
import SwiftData

struct GroupRow: View {
    var group: GroupConversation

    var body: some View {
        HStack {
            // Nom de l'activité
            Text(group.activity?.name ?? "Activité inconnue")
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            // Nombre de messages
            Text("\(group.messages.count) messages")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color("PurpleContent"))
        .cornerRadius(10)
    }
}
