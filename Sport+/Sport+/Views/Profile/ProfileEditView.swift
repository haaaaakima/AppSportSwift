//
//  ProfileEditView.swift
//  Sport+
//
//  Created by DevTipsy94 on 12/03/2025.
//

import SwiftUI

struct ProfileEditView: View {
    var body: some View {
        ZStack {
            // Couleur de fond de l'écran entier
            Color("PurpleBackground")
                .ignoresSafeArea()
            
            VStack {
                Text("ProfileEditView")
                    .font(.body)
            }
        }
    }
}

#Preview {
    ProfileEditView()
}
