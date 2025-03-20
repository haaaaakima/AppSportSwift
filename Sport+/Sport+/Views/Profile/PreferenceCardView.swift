//
//  PreferenceCardView.swift
//  Sport+
//
//  Created by DevTipsy94 on 11/03/2025.
//

import SwiftUI

struct PreferenceCard: View {
    let preference: Preference

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: preference.image)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .foregroundColor(Color("Vert"))
            
            Text(preference.sportType.rawValue.capitalized)
                .font(.caption)
                .foregroundColor(.white)
        }
        .padding(5)
        .frame(width: 100, height: 100)
        .background(Color.purpleContent)
        .cornerRadius(10)
    }
}

#Preview {
    PreferenceCard(preference: Preference(sportType: .musculation, image: "figure.muscle"))
}
