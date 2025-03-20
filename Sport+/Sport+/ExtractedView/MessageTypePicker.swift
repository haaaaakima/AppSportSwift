import SwiftUI
import SwiftData

struct MessageTypePicker: View {
    @Binding var messageType: MessageType
    
    var backColor: Color = Color("PurpleBackground")
    
    init(messageType: Binding<MessageType>) {
        self._messageType = messageType
        
        // Personnalisation de l'apparence du UISegmentedControl
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("Vert")) // Fond vert pour l'élément sélectionné
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected) // Texte noir pour l'élément sélectionné
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.gray)], for: .normal) // Texte par défaut pour les autres éléments
    }
    
    var body: some View {
        VStack {
            Picker("Type de message", selection: $messageType) {
                ForEach(MessageType.allCases, id: \.self) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .padding(.horizontal) // Ajoute un padding horizontal
            .pickerStyle(SegmentedPickerStyle())
            .background(backColor) // Applique la couleur de fond au Picker
            .cornerRadius(8) // Coins arrondis pour le Picker
        }
        .padding(.vertical, 30)
        .background(backColor) // Applique la couleur de fond à toute la vue
    }
}

#Preview {
    MessageTypePicker(messageType: .constant(.amis))
}
