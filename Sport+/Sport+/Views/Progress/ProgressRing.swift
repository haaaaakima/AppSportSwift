//
//  ProgressRing.swift
//  SportConnect
//
//  Created by apprenant106 on 03/03/2025.
//

import SwiftUI

struct ProgressRing: View {
    var progress: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.searchBar).opacity(0.3), lineWidth: 10)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color(.vert), lineWidth: 10)
                .rotationEffect(.degrees(270))
                .animation(.linear, value: progress)
        }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing(progress: 0.75)
            .background(Color(.purpleBackground))
    }
}
