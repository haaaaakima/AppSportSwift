//
//  CustomBackButton.swift
//  Sport+
//
//  Created by DevTipsy94 on 18/03/2025.
//

import SwiftUI

public struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    public var body: some View {
        VStack {
            
        }                .navigationBarBackButtonHidden(true) // Cacher le bouton retour par défaut
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss() // Retour en arrière
                    }) {
                        Image(systemName: "chevron.left") // Utilisation du chevron classique
                            .foregroundColor(Color("Vert")) // Changer la couleur en vert
                            .font(.title2)
                    }
                }
            }
    }
}
