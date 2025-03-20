//
//  MetricProgressRing.swift
//  SportConnect
//
//  Created by apprenant106 on 04/03/2025.
//

import SwiftUI

struct MetricProgressRing: View {
    var progress: Double

        var body: some View {
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.3), lineWidth: 10) // Couleur originale
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color(.vert), lineWidth: 10) // Couleur originale
                    .rotationEffect(.degrees(270))
                    .animation(.linear, value: progress) // Animation fluide
            }
        }
    }

struct MetricProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        MetricProgressRing(progress: 0.75)
            .background(Color(.searchBar))
    }
}
