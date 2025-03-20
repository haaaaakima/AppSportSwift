//
//  FavoriteActivitiesView.swift
//  Sport+
//
//  Created by DevTipsy94 on 11/03/2025.
//

import SwiftUI

struct FavoriteActivitiesView: View {
    let preferences: [Preference]
    let screenWidth: CGFloat

    var body: some View {
        VStack(alignment: .center) {
            if !preferences.isEmpty {
                let prefsToShow = Array(preferences.prefix(3))
                let spacing: CGFloat = 15
                let cardWidth = (screenWidth - (CGFloat(prefsToShow.count + 1) * spacing)) / CGFloat(prefsToShow.count)

                HStack(spacing: spacing) {
                    ForEach(prefsToShow, id: \.id) { pref in
                        PreferenceCard(preference: pref)
                            .frame(width: cardWidth, height: 80)
                    }
                }
                .padding(.horizontal, spacing)
            } else {
                Text("Participez à des activités pour voir vos activités favorites")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.vertical)
            }
        }
    }
}



#Preview {
    FavoriteActivitiesView(preferences: preferences, screenWidth: 375)
}
