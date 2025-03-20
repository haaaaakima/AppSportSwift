import SwiftUI

    // Vue pour la barre de recherche
    struct SearchBar: View {
        @Binding var text: String

        var body: some View {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Rechercher", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                if !text.isEmpty {
                    Button(action: { text = "" }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.vertical, 8)
        }
    }
